/decl/trait/biosynthetic_healing
	name = "Biosynthetic Healing"
	description = "This creature requires specific methods of chemical healing."
	levels = list(REPLIKA_EARLY_GEN, REPLIKA_LATE_GEN)

/mob/living/carbon/human/apply_chemical_effects()
	. = ..()
	// These effects only apply to Replikas.
	if(!HasTrait(/decl/trait/biosynthetic_healing))
		return
	var/burn_regen = GET_CHEMICAL_EFFECT(src, CE_REGEN_BURN_REPLIKA)
	var/brute_regen = GET_CHEMICAL_EFFECT(src, CE_REGEN_BRUTE_REPLIKA)
	if(burn_regen || brute_regen)
		heal_organ_damage(brute_regen, burn_regen, affect_robo = TRUE)
		update_damage_overlays(TRUE)
		return TRUE

/decl/material/solid/plastifoam
	name = "polyurethane foam"
	lore_text = "Polyurethane expanding foam can be used to fill up Replika wounds and stop leaks. \
	Takes a few seconds to expand, but very hard once fully cured."
	metabolism = 2/5 // 0.4u/tick, works out to 30 damage healed over 25 seconds in a 5u spray
	var/strength = 3 // Damage healed per unit.

/decl/material/solid/plastifoam/quick
	name = "quick-setting polyurethane foam"
	lore_text = "Polyurethane resin can be used to fix and fill damaged hull sections. \
	Hardens instantly, but doesn't expand as much."
	metabolism = 5 // metabolizes an entire 5u spray in one tick
	strength = 2

// TODO: have this use limb coating and apply only to wounds/damage on that limb?
/decl/material/solid/plastifoam/affect_touch(mob/living/carbon/human/victim, removed, datum/reagents/holder)
	. = ..()
	if(!istype(victim) || !victim.HasTrait(/decl/trait/biosynthetic_healing))
		return
	victim.add_chemical_effect_max(CE_REGEN_BRUTE_REPLIKA, strength*removed)
	victim.add_chemical_effect_max(CE_REGEN_BURN_REPLIKA, strength*removed)

/decl/material/solid/plastifoam/affect_blood(mob/living/victim, removed, datum/reagents/holder)
	. = ..()
	if(!istype(victim))
		return
	if(victim.HasTrait(/decl/trait/biosynthetic_healing))
		return
	victim.add_chemical_effect_max(CE_BLOCKAGE, 0.4) // lower max blood volume to 60%, very dangerous

/decl/material/solid/plastifoam/affect_inhale(mob/living/carbon/human/victim, removed, datum/reagents/holder)
	. = ..()
	if(!istype(victim))
		return
	var/obj/item/organ/internal/lungs/lung = GET_INTERNAL_ORGAN(victim, BP_LUNGS)
	if(!istype(lung))
		return
	lung.take_internal_damage(removed, FALSE)

/decl/material/solid/koagulant_k
	name = "Coagulant K"
	lore_text = "Coagulant K is a flocculating agent that stops fluid leaks quickly and reliably \
	by thickening Replika oxidant fluid into a gelatinous mass."

/decl/material/solid/koagulant_k/affect_touch(mob/living/carbon/patient, removed, datum/reagents/holder)
	if(patient.HasTrait(/decl/trait/biosynthetic_healing))
		. = affect_blood(patient, removed, holder)
	return ..() || .

/decl/material/solid/koagulant_k/affect_blood(mob/living/carbon/patient, removed, datum/reagents/holder)
	// Toxic to non-Replikas.
	if(!istype(patient) || !patient.HasTrait(/decl/trait/biosynthetic_healing)) //istype(patient) || !patient.species || (patient.species.get_root_species_name() != SPECIES_REPLIKA)
		SET_STATUS_MAX(patient, STAT_BLURRY, 30)
		patient.add_chemical_effect(CE_BLOCKAGE, (45 + REAGENT_VOLUME(holder, type))/100)
		patient.adjustToxLoss(2 * removed)
		return
	patient.add_chemical_effect_max(CE_REGEN_BRUTE_REPLIKA, 2*removed)
	patient.add_chemical_effect_max(CE_REGEN_BURN_REPLIKA, 2*removed)
	for(var/obj/item/organ/external/limb in patient.get_external_organs())
		if(!(limb.status & (ORGAN_ARTERY_CUT|ORGAN_BLEEDING)) || !prob(2 + REAGENT_VOLUME(holder, type)))
			continue
		if(limb.status & ORGAN_ARTERY_CUT)
			limb.status &= ~ORGAN_ARTERY_CUT
			break
		if(limb.status & ORGAN_BLEEDING)
			var/closed_wound = FALSE
			for(var/datum/wound/affected_wound in limb.wounds)
				if(affected_wound.bleeding() && !affected_wound.clamped)
					affected_wound.clamped = TRUE
					closed_wound = TRUE
					break
			if(closed_wound)
				break
	..()

/decl/material/liquid/klstim_n
	name = "Circulatory Stimulant N"
	lore_text = "Circulatory Stimulant N is an emergency stimulant for stabilizing or resuscitating critically injured Replikas of Generation 3 and up."

/decl/material/liquid/klstim_n/affect_blood(mob/living/victim, removed, datum/reagents/holder)
	if(!istype(victim) || !victim.HasTrait(/decl/trait/biosynthetic_healing))
		return
	var/replika_gen = victim.GetTraitLevel(/decl/trait/biosynthetic_healing)
	var/volume = REAGENT_VOLUME(holder, type)
	var/dose = LAZYACCESS(victim.chem_doses, type)
	if(dose < 0.2)	//not that effective after initial rush
		victim.add_chemical_effect(CE_PAINKILLER, min(30*volume, 80))
		victim.add_chemical_effect(CE_PULSE, 1)
	else if(dose < 1)
		victim.add_chemical_effect(CE_PAINKILLER, min(10*volume, 20))
	victim.add_chemical_effect(CE_PULSE, 2)
	if(dose > 10)
		ADJ_STATUS(victim, STAT_JITTER, 5)
	if(volume >= 5 && victim.is_asystole())
		holder.remove_reagent(type, 5)
		if(ishuman(victim))
			var/mob/living/carbon/human/human_victim = victim
			if(human_victim.resuscitate())
				var/obj/item/organ/internal/heart = GET_INTERNAL_ORGAN(human_victim, BP_HEART)
				heart.take_internal_damage(heart.max_damage * 0.15)
	if(replika_gen == REPLIKA_EARLY_GEN) // ARARs get some nasty side effects
		SET_STATUS_MAX(victim, STAT_BLURRY, 30)
		victim.add_chemical_effect(CE_BLOCKAGE, (45 + REAGENT_VOLUME(holder, type))/100)
		if(prob(100/((30 SECONDS)/(2 SECONDS)))) // roughly once per 30 seconds, or every 15 ticks
			to_chat(victim, SPAN_WARNING("You feel your oxidant fluid slowing to a crawl beneath your skin..."))
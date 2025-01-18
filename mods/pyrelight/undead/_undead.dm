// This is included in main code due to the invasive overrides needed in human life processing.
/decl/trait/undead
	name = "Undead"
	description = "Your body is dead, but remains animated through some supernatural force."
	levels = list(TRAIT_LEVEL_MINOR, TRAIT_LEVEL_MODERATE) // Moderate means skeleton, minor means zombie.

/mob/living/human/ssd_check()
	if(has_trait(/decl/trait/undead))
		return FALSE
	return ..()

/mob/living/human/get_movement_delay(travel_dir)
	. = ..()
	if(has_trait(/decl/trait/undead))
		var/static/default_walk_delay = get_config_value(/decl/config/num/movement_walk)
		. = max(., default_walk_delay)

/mob/living/can_feel_pain(var/check_organ)
	return !has_trait(/decl/trait/undead) && ..()

/mob/living/human/get_attack_telegraph_delay()
	if(has_trait(/decl/trait/undead))
		return (0.6 SECONDS)
	return ..()

/mob/living/human/get_death_message(gibbed)
	if(has_trait(/decl/trait/undead, TRAIT_LEVEL_MODERATE))
		return "crumbles and falls apart!"
	return ..()

/mob/living/human/gib(do_gibs = TRUE)
	do_gibs &&= !has_trait(/decl/trait/undead, TRAIT_LEVEL_MODERATE)
	return ..(do_gibs)

/mob/living/human/get_self_death_message(gibbed)
	return has_trait(/decl/trait/undead, TRAIT_LEVEL_MODERATE) ? "You have crumbled." : ..()

/mob/living/human/death(gibbed)
	if(!(. = ..()))
		return
	if(!QDELETED(src) && !gibbed && has_trait(/decl/trait/undead, TRAIT_LEVEL_MODERATE))
		gib()

/mob/living/human/get_gibber_type()
	return has_trait(/decl/trait/undead, TRAIT_LEVEL_MODERATE) ? null : ..()

/datum/skillset/undead
	default_value = SKILL_BASIC

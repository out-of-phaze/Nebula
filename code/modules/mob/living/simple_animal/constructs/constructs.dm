/mob/living/simple_animal/construct
	name = "Construct"
	real_name = "Construct"
	desc = ""
	emote_speech = list("Hsssssssszsht.", "Hsssssssss...", "Tcshsssssssszht!")
	speak_emote = list("hisses")
	emote_hear = list("wails","screeches")
	base_animal_type = /mob/living/simple_animal/construct

	response_help_1p = "You think better of touching $TARGET$."
	response_help_3p = "$USER$ thinks better of touching $TARGET$."
	response_disarm =  "flails at"
	response_harm =    "punches"
	icon = 'icons/mob/simple_animal/shade.dmi'
	speed = -1
	a_intent = I_HURT
	stop_automated_movement = 1
	status_flags = CANPUSH
	universal_speak = FALSE
	universal_understand = TRUE
	min_gas = null
	max_gas = null
	minbodytemp = 0
	show_stat_health = 1
	faction = "cult"
	supernatural = 1
	see_in_dark = 8
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	mob_swap_flags = HUMAN|SIMPLE_ANIMAL|SLIME|MONKEY
	mob_push_flags = ALLMOBS
	bleed_colour = "#331111"
	gene_damage = -1
	butchery_data = /decl/butchery_data/occult

	z_flags = ZMM_MANGLE_PLANES
	glowing_eyes = TRUE

	var/list/construct_spells = list()

/mob/living/simple_animal/construct/check_has_mouth()
	return FALSE

/mob/living/simple_animal/construct/on_defilement()
	return

/mob/living/simple_animal/construct/Initialize()
	. = ..()
	name = text("[initial(name)] ([random_id(/mob/living/simple_animal/construct, 1000, 9999)])")
	real_name = name
	add_language(/decl/language/cultcommon)
	add_language(/decl/language/cult)
	for(var/spell in construct_spells)
		src.add_spell(new spell, "const_spell_ready")
	set_light(1.5, -2, COLOR_WHITE)
	update_icon()

/mob/living/simple_animal/construct/get_death_message(gibbed)
	return "collapses in a shattered heap."

/mob/living/simple_animal/construct/get_self_death_message(gibbed)
	return "The bonds tying you to this mortal plane have been severed."

/mob/living/simple_animal/construct/death(gibbed)
	. = ..()
	if(. && !gibbed)
		new /obj/item/ectoplasm(src.loc)
		qdel(src)

/mob/living/simple_animal/construct/attack_animal(var/mob/user)
	if(istype(user, /mob/living/simple_animal/construct/builder))
		if(current_health < get_max_health())
			heal_damage(BRUTE, 5)
			user.visible_message("<span class='notice'>\The [user] mends some of \the [src]'s wounds.</span>")
		else
			to_chat(user, "<span class='notice'>\The [src] is undamaged.</span>")
		return
	return ..()

/mob/living/simple_animal/construct/show_other_examine_strings(mob/user, distance, infix, suffix, hideflags, decl/pronouns/pronouns)
	. = ..(user)
	var/current_max_health = get_max_health()
	if(current_health < current_max_health)
		if(current_health >= current_max_health/2)
			to_chat(user, SPAN_WARNING("It looks slightly dented."))
		else
			to_chat(user, SPAN_DANGER("It looks severely dented!"))

/obj/item/ectoplasm
	name = "ectoplasm"
	desc = "Spooky."
	gender = PLURAL
	icon = 'icons/obj/items/ectoplasm.dmi'
	icon_state = ICON_STATE_WORLD
	material = /decl/material/liquid/drink/compote

/////////////////Juggernaut///////////////



/mob/living/simple_animal/construct/armoured
	name = "Juggernaut"
	real_name = "Juggernaut"
	desc = "A possessed suit of armour driven by the will of the restless dead"
	icon = 'icons/mob/simple_animal/construct_behemoth.dmi'
	max_health = 250
	speak_emote = list("rumbles")
	response_harm = "harmlessly punches"
	harm_intent_damage = 0
	natural_weapon = /obj/item/natural_weapon/juggernaut
	mob_size = MOB_SIZE_LARGE
	speed = 3
	environment_smash = 2
	status_flags = 0
	resistance = 10
	construct_spells = list(/spell/aoe_turf/conjure/forcewall/lesser)
	can_escape = TRUE

/obj/item/natural_weapon/juggernaut
	name = "armored gauntlet"
	gender = NEUTER
	attack_verb = list("smashed", "demolished")
	hitsound = 'sound/weapons/heavysmash.ogg'
	force = 30

/mob/living/simple_animal/construct/armoured/handle_regular_status_updates()
	set_status(STAT_WEAK, 0)
	if ((. = ..()))
		return

/mob/living/simple_animal/construct/armoured/bullet_act(var/obj/item/projectile/P)
	if(istype(P, /obj/item/projectile/energy) || istype(P, /obj/item/projectile/beam))
		var/reflectchance = 80 - round(P.damage/3)
		if(prob(reflectchance))
			take_damage(P.damage * 0.5)
			visible_message("<span class='danger'>The [P.name] gets reflected by [src]'s shell!</span>", \
							"<span class='userdanger'>The [P.name] gets reflected by [src]'s shell!</span>")

			// Find a turf near or on the original location to bounce to
			if(P.starting)
				var/new_x = P.starting.x + pick(0, 0, -1, 1, -2, 2, -2, 2, -2, 2, -3, 3, -3, 3)
				var/new_y = P.starting.y + pick(0, 0, -1, 1, -2, 2, -2, 2, -2, 2, -3, 3, -3, 3)
				var/turf/curloc = get_turf(src)

				// redirect the projectile
				P.redirect(new_x, new_y, curloc, src)

			return -1 // complete projectile permutation

	return (..(P))



////////////////////////Wraith/////////////////////////////////////////////



/mob/living/simple_animal/construct/wraith
	name = "Wraith"
	real_name = "Wraith"
	desc = "A wicked bladed shell contraption piloted by a bound spirit"
	icon = 'icons/mob/simple_animal/construct_floating.dmi'
	max_health = 75
	natural_weapon = /obj/item/natural_weapon/wraith
	speed = -1
	environment_smash = 1
	see_in_dark = 7
	construct_spells = list(/spell/targeted/ethereal_jaunt/shift)

/obj/item/natural_weapon/wraith
	name = "wicked blade"
	gender = NEUTER
	attack_verb = list("slashed", "tore into")
	hitsound = 'sound/weapons/rapidslice.ogg'
	edge = TRUE
	force = 25

/////////////////////////////Artificer/////////////////////////



/mob/living/simple_animal/construct/builder
	name = "Artificer"
	real_name = "Artificer"
	desc = "A bulbous construct dedicated to building and maintaining The Cult of Nar-Sie's armies"
	icon = 'icons/mob/simple_animal/construct_artificer.dmi'
	max_health = 50
	response_harm = "viciously beaten"
	harm_intent_damage = 5
	natural_weapon = /obj/item/natural_weapon/cult_builder
	speed = 0
	environment_smash = 1
	construct_spells = list(/spell/aoe_turf/conjure/construct/lesser,
							/spell/aoe_turf/conjure/wall,
							/spell/aoe_turf/conjure/floor,
							/spell/aoe_turf/conjure/soulstone,
							/spell/aoe_turf/conjure/pylon
							)

/obj/item/natural_weapon/cult_builder
	name = "heavy arms"
	attack_verb = list("rammed")
	force = 5

/////////////////////////////Behemoth/////////////////////////


/mob/living/simple_animal/construct/behemoth
	name = "Behemoth"
	real_name = "Behemoth"
	desc = "The pinnacle of occult technology, Behemoths are the ultimate weapon in the Cult of Nar-Sie's arsenal."
	icon = 'icons/mob/simple_animal/construct_behemoth.dmi'
	max_health = 750
	speak_emote = list("rumbles")
	response_harm = "harmlessly punches"
	harm_intent_damage = 0
	natural_weapon = /obj/item/natural_weapon/juggernaut/behemoth
	speed = 5
	environment_smash = 2
	resistance = 10
	construct_spells = list(/spell/aoe_turf/conjure/forcewall/lesser)
	can_escape = TRUE

/obj/item/natural_weapon/juggernaut/behemoth
	force = 50

////////////////////////Harvester////////////////////////////////



/mob/living/simple_animal/construct/harvester
	name = "Harvester"
	real_name = "Harvester"
	desc = "The promised reward of the livings who follow Nar-Sie. Obtained by offering their bodies to the geometer of blood"
	icon = 'icons/mob/simple_animal/construct_harvester.dmi'
	max_health = 150
	natural_weapon = /obj/item/natural_weapon/harvester
	speed = -1
	environment_smash = 1
	see_in_dark = 7

	construct_spells = list(
			/spell/targeted/harvest
		)

/obj/item/natural_weapon/harvester
	name = "malicious spike"
	gender = NEUTER
	attack_verb = list("violently stabbed", "ran through")
	hitsound = 'sound/weapons/pierce.ogg'
	sharp = TRUE
	force = 25

////////////////HUD//////////////////////
/mob/living/simple_animal/construct/handle_regular_status_updates()
	. = ..()
	if(.)
		silence_spells(purge)

/mob/living/simple_animal/construct/handle_regular_hud_updates()
	. = ..()
	if(.)
		if(fire)
			fire.icon_state = "fire[!!GET_HUD_ALERT(src, /decl/hud_element/condition/fire)]"
		silence_spells(purge)
		if(healths)
			switch(current_health)
				if(250 to INFINITY)		healths.icon_state = "health0"
				if(208 to 249)			healths.icon_state = "health1"
				if(167 to 207)			healths.icon_state = "health2"
				if(125 to 166)			healths.icon_state = "health3"
				if(84 to 124)			healths.icon_state = "health4"
				if(42 to 83)			healths.icon_state = "health5"
				if(1 to 41)				healths.icon_state = "health6"
				else					healths.icon_state = "health7"

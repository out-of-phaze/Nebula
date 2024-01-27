var/global/list/pheromone_markers = list()

/datum/extension/scent/custom/pheromone/check_smeller(var/mob/living/carbon/human/smeller)
	. = (..() && istype(smeller) && smeller.can_read_pheromones())

/mob/living/carbon/human/Login()
	. = ..()
	update_pheromone_markers()

/mob/living/carbon/human/proc/update_pheromone_markers()
	if(client)
		if(can_read_pheromones())
			client.images |= global.pheromone_markers
		else
			client.images -= global.pheromone_markers

/mob/living/carbon/human/proc/can_read_pheromones()
	. = (species.name == SPECIES_TZA)
	if(!.)
		var/obj/item/implant/pheromone/imp = locate() in get_organ(BP_HEAD)
		. = (imp && imp.implanted && !imp.malfunction)

/obj/effect/decal/cleanable/pheromone
	name = "pheromone trace"
	invisibility = INVISIBILITY_MAXIMUM
	alpha = 0
	scent_type = /datum/extension/scent/custom/pheromone
	var/image/marker

/obj/effect/decal/cleanable/pheromone/proc/fade()
	alpha = max(alpha-15, 0)
	if(alpha <= 0)
		qdel(src)
	else
		addtimer(CALLBACK(src, PROC_REF(fade)), 1 MINUTE)
		update_scent_marker()

/obj/effect/decal/cleanable/pheromone/Initialize(ml, _age)
	. = ..()
	addtimer(CALLBACK(src, /obj/effect/decal/cleanable/pheromone/proc/fade), 1 MINUTE)
	marker = image(loc = src, icon = 'icons/effects/blood.dmi', icon_state = pick(list("mfloor1", "mfloor2", "mfloor3", "mfloor4", "mfloor5", "mfloor6", "mfloor7")))
	marker.alpha = 90
	marker.plane = ABOVE_LIGHTING_PLANE
	marker.layer = ABOVE_LIGHTING_LAYER

/obj/effect/decal/cleanable/pheromone/Destroy()
	. = ..()
	global.pheromone_markers -= marker
	for(var/client/C)
		C.images -= marker

/obj/effect/decal/cleanable/pheromone/proc/update_scent_marker()
	if(!marker)
		return
	for(var/client/C)
		var/mob/living/carbon/human/H = C.mob
		if(istype(H) && H.can_read_pheromones())
			C.images -= marker
	var/datum/extension/scent/custom/pheromone/smell = get_extension(src, /datum/extension/scent)
	if(!istype(smell))
		return
	marker.alpha = alpha
	if(color)
		marker.color = color
		marker.filters = filter(type="drop_shadow", color = color + "F0", size = 2, offset = 1, x = 0, y = 0)
	global.pheromone_markers |= marker
	for(var/client/C)
		var/mob/living/carbon/human/H = C.mob
		if(istype(H) && H.can_read_pheromones())
			C.images |= marker

/obj/effect/decal/cleanable/pheromone/set_cleanable_scent()
	. = ..()
	update_scent_marker()
	var/datum/extension/scent/custom/pheromone/smell = get_extension(src, /datum/extension/scent)
	if(istype(smell))
		for(var/mob/living/carbon/human/H in all_hearers(smell.holder, smell.range))
			var/turf/T = get_turf(H.loc)
			if(!T || !T.return_air())
				continue
			if(!smell.check_smeller(H))
				continue
			if(smell.scent in H.smell_cooldown)
				to_chat(H, SPAN_NOTICE("The scent of [smell.scent] intensifies."))

/decl/emote/pheromone
	var/smell_message
	var/self_smell_descriptor
	var/scent_color

/decl/emote/pheromone/pain
	key = "scentpain"
	smell_message = "<span class='danger'>PAIN</span>"
	self_smell_descriptor = "distressing"
	scent_color = COLOR_RED

/decl/emote/pheromone/fear
	key = "scentfear"
	smell_message = "<span class='danger'>FEAR</span>"
	self_smell_descriptor = "distressing"
	scent_color = COLOR_RED

/decl/emote/pheromone/calm
	key = "scentcalm"
	smell_message = "<span class='notice'><b>calm</b></span>"
	self_smell_descriptor = "soothing"
	scent_color = COLOR_BLUE

/decl/emote/pheromone/storm
	key = "scentstorm"
	smell_message = "<span class='danger'><b>an oncoming storm</b></span>"
	self_smell_descriptor = "distressing"
	scent_color = COLOR_ORANGE

/decl/emote/pheromone/flood
	key = "scentflood"
	smell_message = "<span class='danger'><b>flooding tunnels</b></span>"
	self_smell_descriptor = "frantic"
	scent_color = COLOR_YELLOW

/decl/emote/pheromone/newsisters
	key = "scentsisters"
	smell_message = "<span class='danger'><b>new sisters</b></span>"
	self_smell_descriptor = "cheerful"
	scent_color = COLOR_GREEN_GRAY

/decl/emote/pheromone/foodgood
	key = "scentgoodfood"
	smell_message = "<span class='danger'><b>lots of good food</b></span>"
	self_smell_descriptor = "enticing"
	scent_color = COLOR_GREEN

/decl/emote/pheromone/foodbad
	key = "scentbadfood"
	smell_message = "<span class='danger'><b>spoiled food</b></span>"
	self_smell_descriptor = "disgusting"
	scent_color = COLOR_PURPLE

/decl/emote/pheromone/happy
	key = "scenthappy"
	smell_message = "<span class='danger'><b>happiness</b></span>"
	self_smell_descriptor = "positive"
	scent_color = COLOR_BABY_BLUE

/decl/emote/pheromone/sad
	key = "scentsad"
	smell_message = "<span class='danger'><b>sadness</b></span>"
	self_smell_descriptor = "ennervating"
	scent_color = COLOR_INDIGO

/decl/emote/pheromone/do_emote(var/atom/user, var/extra_params)
	if(!ismob(user))
		return
	var/mob/M = user
	if(M.incapacitated())
		return
	var/turf/T = get_turf(M)
	if(!T)
		return
	to_chat(user, SPAN_NOTICE("You emit the [self_smell_descriptor ? "[self_smell_descriptor] " : ""]scent of [smell_message]."))
	for(var/mob/living/carbon/human/H in viewers(world.view, user))
		if(H != user && H.stat == CONSCIOUS && H.can_read_pheromones())
			to_chat(H, SPAN_NOTICE("\The [user] emits the [self_smell_descriptor ? "[self_smell_descriptor] " : ""]scent of [smell_message]."))

	var/obj/effect/decal/cleanable/pheromone/pheromone = (locate() in T) || new(T)
	pheromone.color = scent_color || get_random_colour()
	pheromone.alpha = min(pheromone.alpha+30, 120)
	pheromone.cleanable_scent = smell_message
	pheromone.desc = "It smells of [smell_message]."
	pheromone.set_cleanable_scent()

/decl/emote/pheromone/custom
	key = "scentcustom"

/decl/emote/pheromone/custom/do_emote(var/atom/user, var/extra_params)
	var/new_smell = sanitize(extra_params || input("Please enter a short pheromone message.", "Pheromone") as text|null, max_length = MAX_LNAME_LEN)
	if(new_smell)
		smell_message = new_smell
		. = ..()

/obj/item/implant/pheromone
	name = "pheromone implant"
	desc = "A civilian-grade implant for communicating with tza workers via pheromones."
	origin_tech = "{'materials':1,'biotech':1}"

/obj/item/implanter/pheromone
	name = "implanter (P)"
	imp = /obj/item/implant/pheromone

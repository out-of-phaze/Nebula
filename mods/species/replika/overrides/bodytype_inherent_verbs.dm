/mob/living/carbon/human/set_bodytype(decl/bodytype/new_bodytype, rebuild_body = FALSE)
	if(ispath(new_bodytype))
		new_bodytype = GET_DECL(new_bodytype)
	if(istype(new_bodytype) && bodytype != new_bodytype)
		bodytype?.on_lose(src)
		..()
		new_bodytype.on_gain(src)

/decl/bodytype
	var/list/inherent_verbs

/decl/bodytype/proc/add_inherent_verbs(mob/living/carbon/human/organism)
	if(!LAZYLEN(inherent_verbs))
		return
	for(var/verb_path in inherent_verbs)
		organism.verbs += verb_path

/decl/bodytype/proc/remove_inherent_verbs(mob/living/carbon/human/organism)
	if(!LAZYLEN(inherent_verbs))
		return
	for(var/verb_path in inherent_verbs)
		organism.verbs -= verb_path

/decl/bodytype/proc/on_gain(mob/living/carbon/human/organism)
	add_inherent_verbs(organism)

/decl/bodytype/proc/on_lose(mob/living/carbon/human/organism)
	remove_inherent_verbs(organism)
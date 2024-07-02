/obj/item/organ/internal/brain/robotic/replika
	name = "neural matrix"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "brain-prosthetic"
	parent_organ = BP_HEAD

/obj/item/organ/internal/eyes/robot/replika
	icon = 'icons/obj/surgery.dmi'
	icon_state = "eyes"
	alive_icon = "eyes"
	dead_icon = "eyes"
	prosthetic_icon = "eyes"
	prosthetic_dead_icon = "eyes"

/obj/item/organ/internal/heart/replika
	name = "oxidant impeller"
	prosthetic_icon = "heart-on"
	prosthetic_dead_icon = "heart-off"
	organ_properties = ORGAN_PROP_PROSTHETIC

/obj/item/organ/internal/lungs/replika
	name = "gas exchange sacs"
	prosthetic_icon = "lungs"
	organ_properties = ORGAN_PROP_PROSTHETIC

/obj/item/organ/internal/stomach/replika
	name = "reagent processor"
	organ_properties = ORGAN_PROP_PROSTHETIC

/obj/item/organ/external/head/replika
	glowing_eyes = TRUE

// Make the glow stop once decapitated.
/obj/item/organ/external/head/replika/on_remove_effects(var/mob/living/last_owner)
	. = ..()
	glowing_eyes = FALSE

/obj/item/organ/external/head/replika/do_install(mob/living/human/target, obj/item/organ/external/affected, in_place)
	if(!(. = ..()))
		return
	events_repository.register(/decl/observ/death, owner, src, PROC_REF(on_owner_death))
	events_repository.register(/decl/observ/life, owner, src, PROC_REF(on_owner_revive))

/obj/item/organ/external/head/replika/proc/on_owner_death()
	glowing_eyes = FALSE

/obj/item/organ/external/head/replika/proc/on_owner_revive()
	glowing_eyes = TRUE

/obj/item/organ/external/head/replika/do_uninstall(in_place, detach, ignore_children)
	. = ..()
	events_repository.unregister(/decl/observ/death, owner, src, PROC_REF(on_owner_death))
	events_repository.unregister(/decl/observ/life, owner, src, PROC_REF(on_owner_revive))
	glowing_eyes = FALSE
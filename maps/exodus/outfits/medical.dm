/decl/hierarchy/outfit/job/medical
	abstract_type = /decl/hierarchy/outfit/job/medical
	l_ear = /obj/item/radio/headset/headset_med
	shoes = /obj/item/clothing/shoes/color/white
	pda_type = /obj/item/modular_computer/pda/medical
	pda_slot = slot_l_store_str

/decl/hierarchy/outfit/job/medical/Initialize()
	. = ..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/medical/cmo
	name = "Job - Chief Medical Officer"
	l_ear = /obj/item/radio/headset/heads/cmo
	uniform = /obj/item/clothing/under/chief_medical_officer
	suit = /obj/item/clothing/suit/toggle/labcoat/cmo
	shoes = /obj/item/clothing/shoes/color/brown
	hands = list(/obj/item/firstaid/adv)
	r_pocket = /obj/item/flashlight/pen
	id_type = /obj/item/card/id/medical/head
	pda_type = /obj/item/modular_computer/pda/heads

/decl/hierarchy/outfit/job/medical/doctor
	name = "Job - Medical Doctor"
	uniform = /obj/item/clothing/under/medical
	suit = /obj/item/clothing/suit/toggle/labcoat
	hands = list(/obj/item/firstaid/adv)
	r_pocket = /obj/item/flashlight/pen
	id_type = /obj/item/card/id/medical

/decl/hierarchy/outfit/job/medical/doctor/emergency_physician
	name = "Job - Emergency physician"
	suit = /obj/item/clothing/suit/jacket/first_responder

/decl/hierarchy/outfit/job/medical/doctor/surgeon
	name = "Job - Surgeon"
	uniform = /obj/item/clothing/under/medical/scrubs/blue
	head = /obj/item/clothing/head/surgery/blue

/decl/hierarchy/outfit/job/medical/doctor/virologist
	name = "Job - Virologist"
	uniform = /obj/item/clothing/under/virologist
	suit = /obj/item/clothing/suit/toggle/labcoat/virologist
	mask = /obj/item/clothing/mask/surgical

/decl/hierarchy/outfit/job/medical/doctor/virologist/Initialize()
	. = ..()
	BACKPACK_OVERRIDE_VIROLOGY

/decl/hierarchy/outfit/job/medical/doctor/nurse
	name = "Job - Nurse"
	suit = null

/decl/hierarchy/outfit/job/medical/doctor/nurse/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == FEMALE)
		if(prob(50))
			uniform = /obj/item/clothing/under/nursesuit
		else
			uniform = /obj/item/clothing/under/nurse
		head = /obj/item/clothing/head/nursehat
	else
		uniform = /obj/item/clothing/under/medical/scrubs/purple
		head = null

/decl/hierarchy/outfit/job/medical/chemist
	name = "Job - Chemist"
	uniform = /obj/item/clothing/under/chemist
	suit = /obj/item/clothing/suit/toggle/labcoat/chemist
	id_type = /obj/item/card/id/medical
	pda_type = /obj/item/modular_computer/pda/medical

/decl/hierarchy/outfit/job/medical/chemist/Initialize()
	. = ..()
	BACKPACK_OVERRIDE_VIROLOGY

/decl/hierarchy/outfit/job/medical/psychiatrist
	name = "Job - Psychiatrist"
	uniform = /obj/item/clothing/under/psych
	suit = /obj/item/clothing/suit/toggle/labcoat
	shoes = /obj/item/clothing/shoes/dress
	id_type = /obj/item/card/id/medical

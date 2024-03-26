/////////////
// Science //
/////////////
/obj/item/card/id/science
	name = "identification card"
	desc = "A card issued to colonial survey staff."
	detail_color = COLOR_PALE_PURPLE_GRAY

/obj/item/card/id/science/head
	name = "identification card"
	desc = "A card which represents knowledge and reasoning."
	extra_details = list("goldstripe")

/decl/hierarchy/outfit/job/signal_science
	uniform = /obj/item/clothing/under/color/white
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/science
	shoes = /obj/item/clothing/shoes/color/white
	l_ear = /obj/item/radio/headset/headset_sci
	pda_type = /obj/item/modular_computer/pda/science
	id_type = /obj/item/card/id/science

/decl/hierarchy/outfit/job/signal_science/scientist
	name = "Job - Research Scientist"

/decl/hierarchy/outfit/job/signal_science/trainee
	name = "Job - Research Trainee"

/decl/hierarchy/outfit/job/signal_science/chief
	name = "Job - Chief of Research"
	l_ear = /obj/item/radio/headset/heads/rd
	uniform = /obj/item/clothing/under/research_director
	shoes = /obj/item/clothing/shoes/color/brown
	hands = list(/obj/item/clipboard)
	id_type = /obj/item/card/id/science/head
	pda_type = /obj/item/modular_computer/pda/heads

/decl/hierarchy/outfit/job/signal_science/aquanaut
	name = "Job - Aquanaut"
	uniform = /obj/item/clothing/under/miner
	pda_type = /obj/item/modular_computer/pda/science
	backpack_contents = list(
		/obj/item/crowbar = 1
	)
	outfit_flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/signal_service/aquanaut/Initialize()
	. = ..()
	BACKPACK_OVERRIDE_ENGINEERING

/////////////
// Service //
/////////////
/decl/hierarchy/outfit/job/signal_service
	l_ear = /obj/item/radio/headset/headset_service
	abstract_type = /decl/hierarchy/outfit/job/signal_service

/decl/hierarchy/outfit/job/signal_service/hospitality
	name = "Job - Hospitality Worker"
	uniform = /obj/item/clothing/under/bartender
	id_type = /obj/item/card/id/civilian
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/signal_service/col
	name = "Job - Chief of Logistics"
	uniform = /obj/item/clothing/under/internalaffairs/plain
	l_ear = /obj/item/radio/headset/headset_service
	shoes = /obj/item/clothing/shoes/color/brown
	id_type = /obj/item/card/id/silver
	pda_type = /obj/item/modular_computer/pda/heads/hop
	glasses = /obj/item/clothing/glasses/sunglasses
	hands = list(/obj/item/clipboard)

/decl/hierarchy/outfit/job/signal_service/janitor
	name = "Job - Sanitation technician"
	uniform = /obj/item/clothing/under/janitor
	id_type = /obj/item/card/id/civilian
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/signal_service/supply_tech
	name = "Job - Supply technician"
	uniform = /obj/item/clothing/under/cargotech
	pda_type = /obj/item/modular_computer/pda/cargo

/decl/hierarchy/outfit/job/signal_service/mining
	name = "Job - Ice miner"
	uniform = /obj/item/clothing/under/miner
	pda_type = /obj/item/modular_computer/pda/cargo
	backpack_contents = list(
		/obj/item/crowbar = 1,
		/obj/item/storage/ore = 1
	)
	outfit_flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/signal_service/mining/Initialize()
	. = ..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/signal_service/pilot
	name = "Job - Submarine pilot"
	uniform = /obj/item/clothing/under/pilot
	pda_type = /obj/item/modular_computer/pda/cargo
	outfit_flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/////////////
// Medical //
/////////////
/obj/item/card/id/medical
	name = "identification card"
	desc = "A card issued to medical staff."
	detail_color = COLOR_PALE_BLUE_GRAY

/obj/item/card/id/medical/head
	name = "identification card"
	desc = "A card which represents care and compassion."
	extra_details = list("goldstripe")

/decl/hierarchy/outfit/job/signal_medical
	abstract_type = /decl/hierarchy/outfit/job/signal_medical
	l_ear = /obj/item/radio/headset/headset_med
	shoes = /obj/item/clothing/shoes/color/white
	pda_type = /obj/item/modular_computer/pda/medical
	id_type = /obj/item/card/id/medical

/decl/hierarchy/outfit/job/signal_medical/Initialize()
	. = ..()
	BACKPACK_OVERRIDE_MEDICAL

/decl/hierarchy/outfit/job/signal_medical/cmo
	name = "Job - Chief of Medicine"
	l_ear = /obj/item/radio/headset/heads/cmo
	uniform = /obj/item/clothing/under/chief_medical_officer
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/cmo
	shoes = /obj/item/clothing/shoes/color/brown
	hands = list(/obj/item/storage/firstaid/adv)
	r_pocket = /obj/item/flashlight/pen
	id_type = /obj/item/card/id/medical/head
	pda_type = /obj/item/modular_computer/pda/heads

/decl/hierarchy/outfit/job/signal_medical/doctor
	name = "Job - Medical Doctor"
	uniform = /obj/item/clothing/under/medical
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	hands = list(/obj/item/storage/firstaid/adv)
	r_pocket = /obj/item/flashlight/pen

/decl/hierarchy/outfit/job/signal_medical/trainee
	name = "Job - Medical Trainee"
	uniform = /obj/item/clothing/under/medical
	suit = /obj/item/clothing/suit/storage/toggle/labcoat

/decl/hierarchy/outfit/job/signal_medical/prosthetist
	name = "Job - Prosthetist"
	uniform = /obj/item/clothing/under/color/white
	shoes = /obj/item/clothing/shoes/color/black
	belt = /obj/item/storage/belt/utility/full
	id_type = /obj/item/card/id/medical
	pda_slot = slot_l_store_str

/////////////////
// Engineering //
/////////////////
/decl/hierarchy/outfit/job/signal_engineering
	name = "Job - Civil Engineer"
	head = /obj/item/clothing/head/hardhat
	uniform = /obj/item/clothing/under/engineer
	r_pocket = /obj/item/t_scanner
	belt = /obj/item/storage/belt/utility/full
	l_ear = /obj/item/radio/headset/headset_eng
	shoes = /obj/item/clothing/shoes/workboots
	pda_type = /obj/item/modular_computer/pda/engineering
	pda_slot = slot_l_store_str
	outfit_flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/signal_engineering/Initialize()
	. = ..()
	BACKPACK_OVERRIDE_ENGINEERING

/decl/hierarchy/outfit/job/signal_engineering/trainee
	name = "Job - Engineering Trainee"
	r_pocket = null
	belt = /obj/item/storage/belt/utility

/decl/hierarchy/outfit/job/signal_engineering/head
	name = "Job - Chief of Engineering"
	head = /obj/item/clothing/head/hardhat/white
	l_ear = /obj/item/radio/headset/heads/ce

/decl/hierarchy/outfit/job/signal_engineering/roboticist
	name = "Job - Roboticist"
	uniform = /obj/item/clothing/under/roboticist
	r_pocket = null
	outfit_flags = OUTFIT_HAS_BACKPACK // shouldn't be doing breach repairs

////////////
// Police //
////////////
/obj/item/card/id/security
	name = "identification card"
	desc = "A card issued to members of the Colonial Police."
	color = COLOR_OFF_WHITE
	detail_color = COLOR_MAROON

/obj/item/card/id/security/head
	name = "identification card"
	desc = "A card which represents honor and protection."
	extra_details = list("goldstripe")

/decl/hierarchy/outfit/job/signal_police
	name = "Job - Police Officer"
	id_type = /obj/item/card/id/security
	glasses = /obj/item/clothing/glasses/sunglasses/sechud
	l_ear = /obj/item/radio/headset/headset_sec
	gloves = /obj/item/clothing/gloves/thick
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(/obj/item/handcuffs = 1)

/decl/hierarchy/outfit/job/signal_police/Initialize()
	. = ..()
	BACKPACK_OVERRIDE_SECURITY

/decl/hierarchy/outfit/job/signal_police/trainee
	name = "Job - Police Trainee"

/decl/hierarchy/outfit/job/signal_police/qm
	name = "Job - Police Quartermaster"
	uniform = /obj/item/clothing/under/warden
	l_pocket = /obj/item/flash
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/signal_police/head
	name = "Job - Chief of Police"
	l_ear = /obj/item/radio/headset/heads/hos
	uniform = /obj/item/clothing/under/head_of_security
	id_type = /obj/item/card/id/security/head
	pda_type = /obj/item/modular_computer/pda/heads
	backpack_contents = list(/obj/item/handcuffs = 1)

//////////////////
// COLONY ADMIN //
//////////////////
/decl/hierarchy/outfit/job/signal_admin
	abstract_type = /decl/hierarchy/outfit/job/signal_admin

/decl/hierarchy/outfit/job/signal_admin/executiveassistant
	uniform = /obj/item/clothing/under/internalaffairs/plain/nt
	l_ear = /obj/item/radio/headset/heads
	shoes = /obj/item/clothing/shoes/color/brown
	id_type = /obj/item/card/id/civilian/head
	pda_type = /obj/item/modular_computer/pda/heads

/decl/hierarchy/outfit/job/signal_admin/colonydirector
	name = "Job - Colony Director"
	head = /obj/item/clothing/head/caphat
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/captain
	l_ear = /obj/item/radio/headset/heads/captain
	shoes = /obj/item/clothing/shoes/color/brown
	id_type = /obj/item/card/id/gold
	pda_type = /obj/item/modular_computer/pda/heads/captain
	backpack_contents = list(/obj/item/storage/box/ids = 1)

/decl/hierarchy/outfit/job/signal_admin/colonydirector/Initialize()
	. = ..()
	backpack_overrides[/decl/backpack_outfit/backpack]      = /obj/item/storage/backpack/captain
	backpack_overrides[/decl/backpack_outfit/satchel]       = /obj/item/storage/backpack/satchel/cap
	backpack_overrides[/decl/backpack_outfit/messenger_bag] = /obj/item/storage/backpack/messenger/com

/decl/hierarchy/outfit/job/signal_admin/assistantdirector
	name = "Job - Assistant Director"
	uniform = /obj/item/clothing/under/head_of_personnel
	l_ear = /obj/item/radio/headset/heads/hop
	shoes = /obj/item/clothing/shoes/color/brown
	id_type = /obj/item/card/id/silver
	pda_type = /obj/item/modular_computer/pda/heads/hop
	backpack_contents = list(/obj/item/storage/box/ids = 1)

#define SPECIES_REPLIKA "Replika"
#define REPLIKA_EARLY_GEN 1
#define REPLIKA_LATE_GEN  2
#define CE_REGEN_BRUTE_REPLIKA "brutehealreplika" // Causes prosthetic brute damage to regenerate.
#define CE_REGEN_BURN_REPLIKA "burnhealreplika" // Causes prosthetic burn damage to regenerate.

#define CALIBER_SIGNALIS_REVOLVER "12x40mm hollow point"

/decl/modpack/replika
	name = "Replika"
	dreams = list(
		"a Replika", "a Gestalt", "a Protektor",
		"an ADLR model", "an Adler model", "an Adler", "an eagle", "authority", "a conspiracy", "a fountain pen",
		"an ARAR model", "an Ara model", "an Ara", "a service tunnel", "a hermit",
		"a EULR model", "a Eule model", "a Eule", "an owl", "a mirror", "a ballet dancer",
		"a FKLR model", "a Falke model", "a Falke", "a falcon", "a Goddess", "a dreamer", "a strange dream",
		"a KLBR model", "a Kolibri model", "a Kolibri", "a hummingbird", "a cadre of Kolibris", "a swarm of hummingbirds", "a hivemind", "a library",
		"an LSTR model", "an Elster model", "an Elster", "a magpie", "a distant star", "a crashed ship", "a promise remembered", "a promise kept", "a promise broken", "a promise forgotten",
		"a MNHR model", "a Mynah model", "a Mynah", "a cat", "a plush doll",
		"a SAPR model", "a Schnapper",
		"a STAR model", "a Star model", "a Star", "a starling", "respect", "disrespect", "a prized firearm", "insubordination", "a promotion", "obedience",
		"a STCR model", "a Storch model", "a Storch", "a stork", "a fable", "an ancient myth", "Saturn Devouring his Son", "a jackboot",
		"a KNCR model", "a Kranich model"
	)

/decl/modpack/replika/pre_initialize()
	. = ..()
	SSmodpacks.default_submap_whitelisted_species |= SPECIES_REPLIKA

/mob/living/carbon/human/replika
	teleop = TRUE
	var/decl/bodytype/replika/starting_bodytype

/mob/living/carbon/human/replika/Initialize(mapload)
	. = ..(mapload, SPECIES_REPLIKA, null, starting_bodytype)
	var/decl/bodytype/replika/model = get_bodytype()
	set_real_name(model.get_default_name())

/decl/bodytype/replika/proc/get_default_name()
	return "[name]-[add_zero(num2text(random_id(name, 0, 99)), 2)]"

/mob/living/carbon/human/replika/eulr
	starting_bodytype = /decl/bodytype/replika/eulr

/mob/living/carbon/human/replika/eulr/dancing
	ai = /datum/ai/eule_dance

/datum/ai/eule_dance
	var/dancing = FALSE

/datum/ai/eule_dance/do_process(time_elapsed)
	UNLINT(try_dance())

/datum/ai/eule_dance/proc/try_dance()
	set waitfor = FALSE
	if(!dancing)
		dancing = TRUE
		if(prob(5))
			body.custom_emote(VISIBLE_MESSAGE, "dances around.")
		for(var/i = 1, i < 2 SECONDS, i += 0.2 SECONDS)
			body.set_dir((i % 2 == 0) ? EAST : WEST)
			sleep(0.2 SECONDS)
			if(QDELETED(body) || body.client)
				break
		dancing = FALSE

/mob/living/carbon/human/replika/arar
	starting_bodytype = /decl/bodytype/replika/arar

/mob/living/carbon/human/replika/lstr
	starting_bodytype = /decl/bodytype/replika/lstr

/mob/living/carbon/human/replika/star
	starting_bodytype = /decl/bodytype/replika/star
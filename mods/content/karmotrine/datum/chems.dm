/decl/material/liquid/ethanol/karmotrine
	name = "karmotrine"
	lore_text = "A synthetic ethanol substitute, imported to Glitch City in bulk by the British Trademark Council."
	taste_description = "synthetic alcohol"
	color = "#c5e5e4"
	strength = 8
	exoplanet_rarity = MAT_RARITY_NOWHERE
	uid = "chem_ethanol_karmotrine"

	glass_name = "karmotrine"
	glass_desc = "A glass of pure alcoholic concentrate. Cheaper than ethanol, and packs a stronger punch."

/decl/material/liquid/adelhyde
	name = "adelhyde"
	lore_text = "An artificial sweetener invented in 2067 by a research lab trying to find a healthy, non-carcinogenic alternative \
	to contemporary sweeteners. They failed, but the rights to the resulting product were purchased by the British Trademark Council \
	for use in all of their bars in Glitch City."
	color = "#e32642"
	taste_description = "sweetness"
	exoplanet_rarity = MAT_RARITY_NOWHERE
	uid = "chem_adelhyde"

	glass_name = "adelhyde"
	glass_desc = "A glass of pure artificial sweetener. It's like guzzling sugar, if you could afford sugar."

/decl/material/liquid/powdered_delta
	name = "powdered delta"
	lore_text = "Originally a vitamin C supplement developed to deal with a resurgence in nano-scurvy in 2062, powdered delta has also \
	gained popularity as a flavor additive, sour candy coating, facial cleanser, rust remover, and defoliant."
	color = "#88a6e4"
	taste_description = "tangy sourness"
	exoplanet_rarity = MAT_RARITY_NOWHERE
	uid = "chem_adelhyde"

	glass_name = "powdered delta"
	glass_desc = "A glass of powdered delta. Technically speaking, it's medicine, an industrial cleaning agent, and a drink flavorant all at the same time."

/decl/material/liquid/bronson_extract
	name = "bronson extract"
	lore_text = "A bitter, flammable compound extracted from the bronson root plant. Pure bronson extract was made infamous after \
	an incident where a celebrity TV stunt bartender's venue caught fire live on air, spurring the British Trademark Council to \
	warn the public about irresponsible uses of bronson extract, as well as to sell it massively diluted at a high markup."
	color = "#ffc73e"
	taste_description = "bitter earthiness"
	exoplanet_rarity = MAT_RARITY_NOWHERE
	uid = "chem_bronson_extract"
	fuel_value = 1 // as strong as welding fuel, be careful

	glass_name = "bronson extract"
	glass_desc = "A glass of bronson extract. It tastes like you're drinking a plant taken straight out of the dirt... which you basically are."

/decl/material/liquid/capsaicin/flanergide
	name = "flanergide"
	lore_text = "Flanergide is a chemical irritant and lachrymatory agent used by the White Knights of Glitch City for crowd control, \
	and as a cost-effective alternative to capsaicin by the British Trademark Council in various spicy cocktails."
	color = "#a3c770"
	taste_description = "oily spiciness"
	exoplanet_rarity = MAT_RARITY_NOWHERE
	heating_point = T100C
	heating_message = "darkens and thickens as it separates from its water content"
	heating_products = list(
		/decl/material/liquid/capsaicin/condensed/flanergide = 0.5,
		/decl/material/liquid/water = 0.5
	)
	agony_dose = 6 // Big drinks with flanergide are going to be spicy, especially if you drink them quickly.

// used in White Knight crowd control spray/grenades
/decl/material/liquid/capsaicin/condensed/flanergide
	name = "concentrated flanergide"
	lore_text = "Unlike its dilute counterpart, concentrated flanergide is painfully irritating on exposure, and often leads to vomiting, \
	crying, and shortness of breath. Some brave souls still try to substitute it for diluted flanergide in their cocktails anyway, and pay the price."
	color = "#7a9a47"
	taste_description = "pure, concentrated pain"
	exoplanet_rarity = MAT_RARITY_NOWHERE
	heating_point = null
	heating_products = null

/decl/material/liquid/brute_meds/affect_blood(mob/living/M, removed, datum/reagents/holder)
	if(M.has_trait(/decl/trait/biosynthetic_healing))
		return
	return ..()

/decl/material/liquid/burn_meds/affect_blood(mob/living/M, removed, datum/reagents/holder)
	if(M.has_trait(/decl/trait/biosynthetic_healing))
		return
	return ..()

/decl/material/liquid/regenerator/affect_blood(mob/living/M, removed, datum/reagents/holder)
	if(M.has_trait(/decl/trait/biosynthetic_healing))
		return
	return ..()
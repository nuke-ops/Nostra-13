/mob/living/carbon/alien/humanoid/Initialize()
    . = ..()
    if(isbenothropy) // Acid is pretty strong, so bye bye it goes! Benothropy shall not have it!
        var/obj/effect/proc_holder/alien/regurgitate/has_it = locate(obj/effect/proc_holder/alien/regurgitate) in abilities
        if(has_it)
            RemoveAbility(has_it)

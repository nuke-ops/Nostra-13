/datum/reagent/consumable/ethanol/grimreaper
	name = "The Grim Reaper"
	description = "Life and death swirl within the endless void of this skull. Pure entropy consumes almost all light, beckoning you to drink it. Your sure it will kill you... <span='danger'>But you didn't come all this way to stop now did you!?</span>"
	boozepwr = 666
	quality = DRINK_FANTASTIC
	taste_description = "life and death"
	glass_icon_state = "grimreaper"
	glass_name = "Grim Reaper"
	glass_desc = "The glass makes a shiver roll down your spine just being near it."
	value = REAGENT_VALUE_EXCEPTIONAL

/datum/reagent/consumable/ethanol/ectocooler
	name = "Ecto-Cooler"
	description = "A sweet and ghastly drink, sure to make chills run down your spine both from the ice and haunting aperatis."
	boozepwr = 0
	quality = DRINK_VERYGOOD
	taste_description = "sweetness and berry"
	glass_icon_state = "ectocooler"
	glass_name = "Ecto-Cooler"
	glass_desc = "A sweet and ghastly drink."
	value = REAGENT_VALUE_VERY_COMMON

/datum/reagent/consumable/ethanol/ectocooler/on_mob_life(mob/living/carbon/M)
	if(prob(20))
		M.jitteriness += 0.2
	..()

/datum/reagent/consumable/ethanol/missingtex
	name = "missingtexture"
	description = "Hello Gordan."
	boozepwr = 20
	quality = DRINK_NICE
	taste_description = "/datum/reagant/misstexture.dmi"
	glass_icon_state = "missingtex"
	glass_name = "missingtexture"
	glass_desc = "Ah, Gordan Freeman."
	value = REAGENT_VALUE_VERY_RARE

/datum/reagent/consumable/ethanol/thequeen
	name = "The Queen"
	description = "A drink, sure to make Xenos and Aliens alike feel the call of the Hive. Praise the Queen!"
	boozepwr = 5
	quality = DRINK_GOOD
	taste_description = "acid"
	glass_icon_state = "thequeen"
	glass_name = "The Queen"
	glass_desc = "A drink that makes you feel closer to the Hive."
	value = REAGENT_VALUE_UNCOMMON

/datum/reagent/consumable/ethanol/thequeen/on_mob_life(mob/living/carbon/M)
	if(isxenoperson(M))
		M.adjustBruteLoss(-1, 0)
	..()

/datum/reagent/consumable/ethanol/bubbleyum
	name = "Bubbleyum"
	description = "A sweet and <span='danger'>delightful</span> drink!"
	boozepwr = 0
	quality = DRINK_GOOD
	taste_description = "gum and blood"
	glass_icon_state = "bubbleyum"
	glass_name = "Bubbleyum"
	glass_desc = "Yum, yum, yum!"
	value = REAGENT_VALUE_UNCOMMON

/datum/reagent/consumable/ethanol/bubbleyum/on_mob_life(mob/living/carbon/M)
	if(prob(15))
		new /datum/hallucination/oh_yeah(M)
	..()

/datum/reagent/consumable/ethanol/whiskeywarper
	name = "Whiskey Warper"
	description = "A sour drink held in a cup with too many holes, shouldn't this be used as an instrument?"
	boozepwr = 15
	quality = DRINK_NICE
	taste_description = "whiskey and magic"
	glass_icon_state = "whiskeywarper"
	glass_name = "Whiskey Warper"
	glass_desc = "You could have sworn you heard a gentle tune..."
	overdose_threshold = 30
	value = REAGENT_VALUE_VERY_RARE

/datum/reagent/consumable/ethanol/whiskeywarper/on_mob_life(mob/living/carbon/M)
	var/warp = 0
	var/canwarp = TRUE
	if(warp <= 0 && prob(1))
		warp = 1
	..()
	if(warp >= 1 && canwarp == TRUE)
		canwarp = FALSE
		var/turf/T = get_turf(M)
		if(M.mind.assigned_role == "Clown")
			playsound(T,'modular_nostra/sound/effects/whiskeywarperhonk.ogg', 50, TRUE)
		else
			playsound(T,'modular_nostra/sound/effects/drinkwhistlewarp.ogg', 50, TRUE)
		ADD_TRAIT(M, TRAIT_MOBILITY_NOMOVE, src)
		ADD_TRAIT(M, TRAIT_MOBILITY_NOUSE, src)
		ADD_TRAIT(M, TRAIT_MOBILITY_NOPICKUP, src)
		M.update_mobility()
		new /obj/effect/temp_visual/tornado(T)
		sleep(20)
		M.invisibility = INVISIBILITY_MAXIMUM
		sleep(20)
		var/breakout = 0
		while(breakout < 10)
			if(!T)
				endwhiskey(M)
				return
			var/turf/potential_T = find_safe_turf()
			if(!potential_T)
				endwhiskey(M)
				return
			if(T.z != potential_T.z || abs(get_dist_euclidian(potential_T,T)) > 10 - breakout)
				do_teleport(M, potential_T, channel = TELEPORT_CHANNEL_MAGIC)
				T = potential_T
				break
			breakout += 1
		new /obj/effect/temp_visual/tornado(T)
		sleep(20)
		canwarp = TRUE
		warp = 0
		endwhiskey(M)
	..()

/datum/reagent/consumable/ethanol/whiskeywarper/overdose_start(mob/living/M)
	to_chat(M, "<span class='userdanger'>You feel queasy...</span>")
	M.Stun(30)

/datum/reagent/consumable/ethanol/whiskeywarper/overdose_process(mob/living/M)
	if(prob(40))
		M.Unconscious(10)
	..()

/datum/reagent/consumable/ethanol/whiskeywarper/proc/endwhiskey(mob/living/carbon/M)
	M.invisibility = initial(M.invisibility)
	REMOVE_TRAIT(M, TRAIT_MOBILITY_NOMOVE, src)
	REMOVE_TRAIT(M, TRAIT_MOBILITY_NOUSE, src)
	REMOVE_TRAIT(M, TRAIT_MOBILITY_NOPICKUP, src)
	M.update_mobility()

/datum/reagent/consumable/ethanol/chwinger
	name = "Chwinger"
	description = "Created by a dwarven bartender, the Chwinger is the fastest method to enjoy the wine taste testing experience.... its an experience alright."
	boozepwr = 36
	quality = DRINK_VERYGOOD
	taste_description = "dry crackers and sour cheese"
	glass_icon_state = "chwinger"
	glass_name = "Chwinger"
	glass_desc = "Wine with rim of cheese and a cracker on-top."
	value = REAGENT_VALUE_UNCOMMON

/datum/reagent/consumable/ethanol/redstar
	name = "Red Star"
	description = "Shine bright like the hottest star!"
	boozepwr = 0
	quality = DRINK_GOOD
	taste_description = "oranges and bitterness"
	glass_icon_state = "redstar"
	glass_name = "Red Star"
	glass_desc = "A nice bitter and juicy drink."
	value = REAGENT_VALUE_COMMON

/datum/reagent/consumable/ethanol/bluesmacream
	name = "Bluesmacream"
	description = "Feel the subtly of ancient earth flow across your tastebuds."
	boozepwr = 0
	quality = DRINK_VERYGOOD
	taste_description = "sweetness and blueberries"
	glass_icon_state = "bluesmacream"
	glass_name = "Bluesmacream"
	glass_desc = "A nice sweet blueberry drink."
	value = REAGENT_VALUE_COMMON

/datum/reagent/consumable/ethanol/dryboulder
	name = "Dry Boulder"
	description = "A rock filled with- Something."
	boozepwr = 40
	quality = DRINK_NICE
	taste_description = "dryness and salt"
	glass_icon_state = "dryboulder"
	glass_name = "Dry Boulder"
	glass_desc = "A rock with liquid inside it... Woo?"
	value = REAGENT_VALUE_UNCOMMON

/datum/reagent/consumable/ethanol/dryboulder/on_mob_life(mob/living/carbon/M)
	if(prob(15) && isgolem(M))
		M.adjustBruteLoss(-5, 0)
	..()

/datum/reagent/consumable/ethanol/olivergarden
	name = "Olive Garden"
	description = "A nice bitter drink with a fancy olive to top it off- Mmmm... Olives."
	boozepwr = 40
	quality = DRINK_VERYGOOD
	taste_description = "bitterness and sour"
	glass_icon_state = "olivegarden"
	glass_name = "Olive Garden"
	glass_desc = "A fancy drink with an Olive on-top."
	value = REAGENT_VALUE_UNCOMMON

/datum/reagent/consumable/ethanol/bonezone
	name = "Bone Zone"
	description = "A spoOOoOooOky drink sure to send shivers down your spine!"
	boozepwr = 0
	quality = DRINK_FANTASTIC
	taste_description = "bones and milk"
	glass_icon_state = "bonezone"
	glass_name = "Bone Zone"
	glass_desc = "A spoOOoOooOky drink sure to send shivers down your spine!"
	value = REAGENT_VALUE_VERY_RARE

/datum/reagent/consumable/ethanol/bonezone/on_mob_life(mob/living/carbon/M)
	if(prob(8))
		playsound(M, 'modular_nostra/sound/effects/2spooky4me.ogg', 75, 1, -1)
		if(!isskeleton(M))
			new /datum/hallucination/delusion(M, TRUE, "skeleton", 3 SECONDS, 0)
	..()

	if(prob(60) && isskeleton(M))
		M.adjustBruteLoss(-5,0)
		M.adjustFireLoss(-5, 0)
	..()

/datum/reagent/consumable/ethanol/kortara
	name = "Kortara"
	description = "A sweet, milky nut-based drink enjoyed on Tizira. Frequently mixed with fruit juices and cocoa for extra refreshment."
	boozepwr = 25
	color = "#EEC39A"
	quality = DRINK_GOOD
	taste_description = "sweet nectar"
	glass_icon_state = "kortara_glass"
	glass_name = "glass of kortara"
	glass_desc = "The fermented nectar of the Korta nut, as enjoyed by lizards galaxywide."

/datum/reagent/consumable/ethanol/kortara/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if(M.getBruteLoss() && DT_PROB(10, delta_time))
		M.heal_bodypart_damage(1,0, 0)
		. = TRUE

/datum/reagent/consumable/ethanol/sea_breeze
	name = "Sea Breeze"
	description = "Light and refreshing with a mint and cocoa hit- like mint choc chip ice cream you can drink!"
	boozepwr = 15
	color = "#CFFFE5"
	quality = DRINK_VERYGOOD
	taste_description = "mint choc chip"
	glass_icon_state = "sea_breeze"
	glass_name = "Sea Breeze"
	glass_desc = "Minty, chocolatey, and creamy. It's like drinkable mint chocolate chip!"

/datum/reagent/consumable/ethanol/sea_breeze/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.apply_status_effect(/datum/status_effect/throat_soothed)
	..()

/datum/reagent/consumable/ethanol/white_tiziran
	name = "White Tiziran"
	description = "A mix of vodka and kortara. The Lizard imbibes."
	boozepwr = 65
	color = "#A68340"
	quality = DRINK_GOOD
	taste_description = "strikes and gutters"
	glass_icon_state = "white_tiziran"
	glass_name = "White Tiziran"
	glass_desc = "I had a rough night and I hate the fucking humans, man."

/datum/reagent/consumable/ethanol/drunken_espatier
	name = "Drunken Espatier"
	description = "Look, if you had to get into a shootout in the cold vacuum of space, you'd want to be drunk too."
	boozepwr = 65
	color = "#A68340"
	quality = DRINK_GOOD
	taste_description = "sorrow"
	glass_icon_state = "drunken_espatier"
	glass_name = "Drunken Espatier"
	glass_desc = "A drink to make facing death easier."

/datum/mood_event/narcotic_medium
	description = "<span class='nicegreen'>I feel comfortably numb.</span>\n"
	mood_change = 4
	timeout = 3 MINUTES

/datum/reagent/consumable/ethanol/drunken_espatier/on_mob_life(mob/living/carbon/C, delta_time, times_fired)
	C.hal_screwyhud = SCREWYHUD_HEALTHY //almost makes you forget how much it hurts
	SEND_SIGNAL(C, COMSIG_ADD_MOOD_EVENT, "numb", /datum/mood_event/narcotic_medium, name) //comfortably numb
	..()

/datum/reagent/consumable/ethanol/protein_blend
	name = "Protein Blend"
	description = "A vile blend of protein, pure grain alcohol, korta flour, and blood. Useful for bulking up, if you can keep it down."
	boozepwr = 65
	color = "#FF5B69"
	quality = DRINK_NICE
	taste_description = "regret"
	glass_icon_state = "protein_blend"
	glass_name = "Protein Blend"
	glass_desc = "Vile, even by lizard standards."
	nutriment_factor = 3 * REAGENTS_METABOLISM

/datum/reagent/consumable/ethanol/protein_blend/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	M.adjust_nutrition(2 * REM * delta_time)
	if(!islizard(M))
		M.adjust_disgust(5 * REM * delta_time)
	else
		M.adjust_disgust(2 * REM * delta_time)
	..()

/datum/reagent/consumable/mushroom_tea
	name = "Mushroom Tea"
	description = "A savoury glass of tea made from polypore mushroom shavings, originally native to Tizira."
	color = "#674945" // rgb: 16, 16, 0
	nutriment_factor = 0
	taste_description = "mushrooms"
	glass_icon_state = "mushroomtea"
	glass_name = "glass of mushroom tea"
	glass_desc = "Oddly savoury for a drink."

/datum/reagent/consumable/mushroom_tea/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if(islizard(M))
		M.adjustOxyLoss(-0.5 * REM * delta_time, 0)
	..()
	. = TRUE

/datum/reagent/consumable/ethanol/mushi_kombucha
	name = "Mushi Kombucha"
	description = "A popular summer beverage on Tizira, made from sweetened mushroom tea."
	boozepwr = 10
	color = "#C46400"
	quality = DRINK_VERYGOOD
	taste_description = "sweet 'shrooms"
	glass_icon_state = "glass_orange"
	glass_name = "glass of mushi kombucha"
	glass_desc = "A glass of (slightly alcoholic) fermented sweetened mushroom tea. Refreshing, if a little strange."

/datum/reagent/consumable/ethanol/triumphal_arch
	name = "Triumphal Arch"
	description = "A drink celebrating the Lizard Empire and its military victories. It's popular at bars on Unification Day."
	boozepwr = 60
	color = "#FFD700"
	quality = DRINK_FANTASTIC
	taste_description = "victory"
	glass_icon_state = "triumphal_arch"
	glass_name = "Triumphal Arch"
	glass_desc = "A toast to the Empire, long may it stand."

/datum/mood_event/memories_of_home
	description = "<span class='nicegreen'>This taste seems oddly nostalgic...</span>\n"
	mood_change = 3
	timeout = 5 MINUTES

/datum/reagent/consumable/ethanol/triumphal_arch/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if(islizard(M))
		SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "triumph", /datum/mood_event/memories_of_home, name)
	..()

/datum/reagent/consumable/ethanol/the_juice
	name = "The Juice"
	description = "Woah man, this like, feels familiar to you dude."
	color = "#4c14be"
	boozepwr = 50
	quality = DRINK_GOOD
	taste_description = "like, the future, man"
	glass_icon_state = "thejuice"
	glass_name = "The Juice"
	glass_desc = "A concoction of not-so-edible things that apparently lets you feel like you're in two places at once"
	var/datum/brain_trauma/special/bluespace_prophet/prophet_trauma

/datum/reagent/consumable/ethanol/the_juice/on_mob_metabolize(mob/living/carbon/victim)
	. = ..()
	prophet_trauma = new()
	victim.gain_trauma(prophet_trauma, TRAUMA_RESILIENCE_ABSOLUTE)

/datum/reagent/consumable/ethanol/the_juice/on_mob_end_metabolize(mob/living/carbon/victim)
	if(prophet_trauma)
		QDEL_NULL(prophet_trauma)
	return ..()

/datum/reagent/consumable/ethanol/ratvir
	name = "Ratvir"
	description = "Suffer not a heretic to live- But were off duty so you get a free pass."
	color = "#4c14be"
	boozepwr = 60
	quality = DRINK_GOOD
	taste_description = "brass"
	glass_icon_state = "ratvir"
	glass_name = "Ratvir"
	glass_desc = "A glass filled with liquid brass."

/datum/reagent/consumable/ethanol/ratvir/on_mob_life(mob/living/carbon/M)
	if(M?.mind?.has_antag_datum(/datum/antagonist/clockcult))
		M.heal_bodypart_damage(2, 1, 1)
	return ..()


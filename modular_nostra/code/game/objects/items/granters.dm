#define isfelinid(A) (is_species(A, /datum/species/human/felinid))

/obj/item/book/granter/martial/tribal_claw
	martial = /datum/martial_art/tribal_claw
	name = "old scroll"
	martialname = "tribal claw"
	desc = "A scroll filled with ancient draconic markings."
	greet = "<span class='sciradio'>You have learned the ancient martial art of the Tribal Claw! You are now able to use your tail and claws in a fight much better than before. \
	Check the combos you are now able to perform using the Recall Teachings verb in the Tribal Claw tab</span>"
	icon = 'icons/obj/wizard.dmi'
	icon_state = "scroll2"
	remarks = list("I must prove myself worthy to the masters of the Knoises clan...", "Use your tail to surprise any enemy...", "Your sharp claws can disorient them...", "I don't think this would combine with other martial arts...", "Ooga Booga...")

/obj/item/book/granter/martial/tribal_claw/onlearned(mob/living/carbon/user)
	..()
	if(!oneuse)
		return
	desc = "It's completely blank."
	name = "empty scroll"
	icon_state = "blankscroll"

/obj/item/book/granter/martial/tribal_claw/already_known(mob/user)
	if(islizard(user))
		return FALSE
	else
		to_chat(user, "<span class='warning'>You try to read the scroll but can't comprehend any of it.</span>")
		return TRUE


/obj/item/book/granter/martial/cat_fight
	martial = /datum/martial_art/cat_fight
	name = "Kōkō kanfūneko"
	martialname = "cat fighting"
	desc = "The Felinid Bible."
	greet = "<span class='sciradio'>You have learned how to become a greater degenerate... Thats the cats meow! \
	Check the combos you are now able to perform by using the Recall Tyranny verb, you monster.</span>"
	icon = 'modular_nostra/icons/obj/wizard.dmi'
	icon_state = "manga"
	remarks = list("You can put milk on the cookies first?...", "During this fight she kicked the leading male character in the dick... I could probably use that.", "Nya~...", "In this moment she was betrayed by her best friend, being struck in her beautiful eyes... I can use this.", "I love you Kung Fu Neko-Chan!", "After the main male character accidentally walked in on Neko-chan whilst in the shower, she hilariously kicked him out of the bathroom, knocking him out. When he came to his senses he was somehow completely neko-fied. <span class='warning'>I should definitely use this.</span>")

/obj/item/book/granter/martial/cat_fight/onlearned(mob/living/carbon/user)
	..()
	if(!oneuse)
		return
	desc = "The Felinid Bible."
	name = "manga"
	icon_state = "manga"

/obj/item/book/granter/martial/cat_fight/already_known(mob/user)
	if(isfelinid(user))
		return FALSE
	else
		to_chat(user, "<span class='warning'>You try to read the manga... You hate it!</span>")
		return TRUE

/obj/item/book/granter/martial/goo_fu
	martial = /datum/martial_art/goo_fu
	name = "Slime Scroll"
	martialname = "goo fu"
	desc = "A slime, ready to bestow knowledge upon you."
	greet = "<span class='sciradio'>You have been told the ways of Goo Fu. \
	Check the combos you are now able to perform by using the Recall Ancient Slimes verb.</span>"
	icon = 'modular_nostra/icons/obj/wizard.dmi'
	icon_state = "slimescroll"
	remarks = list("Yeah...", "Uh-huh...", "Mhm...", "Oh really?...", "Interesting...", "Tell me more...")

/obj/item/book/granter/martial/goo_fu/onlearned(mob/living/carbon/user)
	..()
	if(!oneuse)
		return
	desc = "It blinks for a moment."
	name = "slime scroll"
	icon_state = "slimescroll"

/obj/item/book/granter/martial/goo_fu/already_known(mob/user)
	if(isjellyperson(user) || isslimeperson(user) || isluminescent(user) || isstartjelly(user))
		return FALSE
	else
		to_chat(user, "<span class='warning'>You try to understand but can't make out the blorbles...</span>")
		return TRUE


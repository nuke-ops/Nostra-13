//Adding a few cool race restricted items cause why does this not exist already?
/datum/uplink_item/race_restricted/tribal_claw
	name = "Old Tribal Scroll"
	desc = "We found this scroll in a abandoned lizard settlement of the Knoises clan. \
			It teaches you how to use your claws and tail to gain an advantage in combat, \
			don't buy this unless you are a lizard or plan to give it to one as only they can understand the ancient draconic words."
	item = /obj/item/book/granter/martial/tribal_claw
	cost = 18
	surplus = 0
	restricted_species = list("lizard")

/datum/uplink_item/race_restricted/plasma_fist
	name = "frayed scroll"
	desc = "An aged and frayed scrap of paper written in shifting runes. There are hand-drawn illustrations of pugilism."
	item = /obj/item/book/granter/martial/plasma_fist
	cost = 20
	player_minimum = 15
	surplus = 0
	restricted_species = list("plasmaman")

/datum/uplink_item/race_restricted/syndilamp
	name = "Extra-Bright Lantern"
	desc = "We heard that moths such as yourself really like lamps, so we decided to grant you early access to a prototype \
	Syndicate brand \"Extra-Bright Lantern™\". Enjoy."
	cost = 2
	item = /obj/item/flashlight/lantern/syndicate
	restricted_species = list("moth")

/datum/uplink_item/race_restricted/xenothropy
	name = "Xenothropy Injector"
	desc = "Xenomorphs today are the greatest living bio-weapon to exist throughout the cosmos, but with the watchful eye of the Animal Rights Consortium and the many bright minds of Interdyne Pharmaceutics, we have managed to unlock the potential within the evolution of there species. Sadly we could not unwind every genome due to lack of resources, so it remains far weaker then there Ancestorial counterparts."
	cost = 15
	player_minimum = 5
	item = /obj/item/xenothropy
	restricted_species = list("xeno")

/datum/uplink_item/race_restricted/catfight
	name = "Kōkō kanfūneko"
	desc = "With the rise of the cat-eared tyrant, we knew somewhere deep beneath the musk filled tombs hid a secret left untouched... Though this manga book has clearly been touched a lot- In fact a bit too much."
	cost = 20
	item = /obj/item/book/granter/martial/cat_fight
	restricted_species = list("felinid")

/datum/uplink_item/race_restricted/goofu
	name = "Slime Scroll"
	desc = "Xenobiology is the next step in our war effort, though during a tussle against one of Nanotrasens Military Stations, one of our men managed to find this little guy lying around. With due excitement we immediately brought it back and uncovered it's mysterious. It's a shame it only blorbles..."
	cost = 19
	item = /obj/item/book/granter/martial/goo_fu
	restricted_species = list("jelly", "slime", "slimeperson", "slimelumi", "stargazer")

/datum/uplink_item/role_restricted/voodoo
	name = "Wicker Doll"
	desc = "A wicker voodoo doll with a cavity for storing a small item. Once an item has been stored within it, the doll may be used to manipulate the actions of another person that has previously been in contact with the stored item."
	item = /obj/item/voodoo
	cost = 12
	restricted_roles = list("Curator")

/datum/uplink_item/role_restricted/echainsaw
	name = "Energy Chainsaw"
	desc = "An incredibly deadly modified chainsaw with plasma-based energy blades instead of metal and a slick black-and-red finish. While it rips apart matter with extreme efficiency, it is heavy, large, and monstrously loud."
	item = /obj/item/chainsaw/energy
	cost = 10
	player_minimum = 10
	restricted_roles = list("Botanist", "Cook", "Bartender")

/datum/uplink_item/role_restricted/cultconstructkit
	name = "Cult Construct Kit"
	desc = "Recovered from an abandoned Nar'sie cult lair two construct shells and a stash of empty soulstones was found. These were purified to prevent occult contamination and have been put in a belt so they may be used as an accessible source of disposable minions. The construct shells have been packaged into two beacons for rapid and portable deployment."
	item = /obj/item/storage/box/syndie_kit/cultconstructkit
	cost = 20
	restricted_roles = list("Chaplain")

/datum/uplink_item/role_restricted/carpsiereligionbungle
	name = "Carp'Sie Megacarp Kit"
	desc = "With the many Elder Gods being worshipped about, a select few people seem to think Space Carp are the true gods above all, whatever the case may be this box contains three mega carp monkey cubes along with a full carp outfit. We are not responsible for any loss of limbs, flesh or life."
	item = /obj/item/storage/box/syndie_kit/carpsiereligionbungle
	cost = 15
	restricted_roles = list("Chaplain", "Cook")

/datum/uplink_item/role_restricted/syndieseeds
	name = "Packet of Syndie Seeds"
	desc = "Though the existence of gatfruit in major quantities deems to elude us we have managed to genetically modify some plants through countless testing and some assistance from some Russian colleagues to give a similar effect. Comes with one packet of seeds!"
	item = /obj/item/seeds/syndieseeds
	cost = 17
	player_minimum = 10
	restricted_roles = list("Botanist")

/datum/uplink_item/role_restricted/guidetoillusions
	name = "Guide to Illusions"
	desc = "Found this buried beneath an ancient temple that didn't exist, along with the soil around it... We can't seem to wrap our head around it."
	item = /obj/item/book/granter/spell/manifestmimesuit
	cost = 12
	restricted_roles = list("Mime")

/datum/uplink_item/role_restricted/fancyinsulatedgloves
	name = "Fancy Insulated Gloves"
	desc = "Yellow is too obvious, keep the crowd silent with these new fancy insulated gloves that give exact resemblance to the Mimes sacred white gloves! Crafted with confidence to keep Security at-ease."
	item = /obj/item/clothing/gloves/color/whiteinsulated
	cost = 3
	restricted_roles = list("Mime")

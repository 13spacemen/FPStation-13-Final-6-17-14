/obj/item/weapon/phone
	name = "red phone"
	desc = "Should anything ever go wrong..."
	icon = 'icons/obj/items.dmi'
	icon_state = "red_phone"
	flags = FPRINT | TABLEPASS | CONDUCT
	w_class = 2
	attack_verb = list("called", "rang")
	hit_sound = 'sound/weapons/ring.ogg'

/obj/item/weapon/rsp
	name = "\improper Rapid-Seed-Producer (RSP)"
	desc = "A device used to rapidly deploy seeds."
	icon = 'icons/obj/items.dmi'
	icon_state = "rcd"
	var/matter = 0
	var/mode = 1
	flags = TABLEPASS
	w_class = 3.0


/obj/item/weapon/spacecash
	name = "space cash"
	desc = "It's worth 1 credit."
	gender = PLURAL
	icon = 'icons/obj/items.dmi'
	icon_state = "spacecash"
	w_class = 1.0

/obj/item/weapon/spacecash/c10
	icon_state = "spacecash10"
	desc = "It's worth 10 credits."
/obj/item/weapon/spacecash/c20
	icon_state = "spacecash20"
	desc = "It's worth 20 credits."
/obj/item/weapon/spacecash/c50
	icon_state = "spacecash50"
	desc = "It's worth 50 credits."
/obj/item/weapon/spacecash/c100
	icon_state = "spacecash100"
	desc = "It's worth 100 credits."
/obj/item/weapon/spacecash/c200
	icon_state = "spacecash200"
	desc = "It's worth 200 credits."
/obj/item/weapon/spacecash/c500
	icon_state = "spacecash500"
	desc = "It's worth 500 credits."
/obj/item/weapon/spacecash/c1000
	icon_state = "spacecash1000"
	desc = "It's worth 1000 credits."

/obj/item/weapon/bananapeel
	name = "banana peel"
	desc = "A peel from a banana."
	icon = 'icons/obj/items.dmi'
	icon_state = "banana_peel"
	item_state = "banana_peel"
	w_class = 1.0

/obj/item/weapon/corncob
	name = "corn cob"
	desc = "A reminder of meals gone by."
	icon = 'icons/obj/harvest.dmi'
	icon_state = "corncob"
	item_state = "corncob"
	w_class = 1.0

/obj/item/weapon/soap
	name = "soap"
	desc = "A cheap bar of soap. Doesn't smell."
	gender = PLURAL
	icon = 'icons/obj/items.dmi'
	icon_state = "soap"
	w_class = 1.0

	suicide_act(mob/user)
		viewers(user) << pick("\red <b>[user] is dropping the soap! It looks like \he's trying to commit suicide.</b>", \
							"\red <b>[user] is dropping the soap! It looks like \he's trying to commit suicide.</b>")
		return (BRUTELOSS)

/obj/item/weapon/soap/nanotrasen
	desc = "A Nanotrasen brand bar of soap. Smells of plasma."
	icon_state = "soapnt"

/obj/item/weapon/soap/deluxe
	desc = "A deluxe Waffle Co. brand bar of soap. Smells of condoms."
	icon_state = "soapdeluxe"

/obj/item/weapon/soap/syndie
	desc = "An untrustworthy bar of soap. Smells of fear."
	icon_state = "soapsyndie"

/obj/item/weapon/bikehorn
	name = "bike horn"
	desc = "A horn off of a bicycle."
	icon = 'icons/obj/items.dmi'
	icon_state = "bike_horn"
	item_state = "bike_horn"
	w_class = 1
	attack_verb = list("HONKED")
	var/spam_flag = 0


/obj/item/weapon/c_tube
	name = "cardboard tube"
	desc = "A tube... of cardboard."
	icon = 'icons/obj/items.dmi'
	icon_state = "c_tube"
	w_class = 1

/obj/item/weapon/cane
	name = "cane"
	desc = "A cane used by a true gentlemen. Or a clown."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "cane"
	item_state = "stick"
	flags = FPRINT | TABLEPASS| CONDUCT
	force = DAMAGE_LOW
	w_class = 2.0
	m_amt = 50
	attack_verb = list("bludgeoned", "whacked", "disciplined", "thrashed")

/obj/item/weapon/disk
	name = "disk"
	icon = 'icons/obj/items.dmi'

/obj/item/weapon/disk/nuclear
	name = "nuclear authentication disk"
	desc = "Better keep this safe."
	icon_state = "nucleardisk"
	item_state = "card-id"
	w_class = 1.0


//The Dummy is used to figure out if certain things can reach and or move into a tile
/obj/item/weapon/dummy
	name = "dummy"
	invisibility = 101.0
	anchored = 1.0
	flags = TABLEPASS

	ex_act()
		return

	blob_act()
		return


/*
/obj/item/weapon/game_kit
	name = "Gaming Kit"
	icon = 'icons/obj/items.dmi'
	icon_state = "game_kit"
	var/selected = null
	var/board_stat = null
	var/data = ""
	var/base_url = "http://svn.slurm.us/public/spacestation13/misc/game_kit"
	item_state = "sheet-metal"
	w_class = 5.0
*/

/obj/item/weapon/gift
	name = "gift"
	desc = "A wrapped item."
	icon = 'icons/obj/items.dmi'
	icon_state = "gift3"
	var/size = 3.0
	var/obj/item/gift = null
	item_state = "gift"
	w_class = 4.0


/obj/item/weapon/caution
	desc = "Caution! Wet Floor!"
	name = "wet floor sign"
	icon = 'icons/obj/janitor.dmi'
	icon_state = "caution"
	w_class = 2.0
	flags = FPRINT | TABLEPASS
	attack_verb = list("warned", "cautioned", "smashed")


/obj/item/weapon/caution/slip
	var/on
	HasProximity(atom/movable/AM as mob|obj)
		if(ishuman(AM) && prob(40) && on)
			playsound(src.loc, 'sound/misc/slip.ogg', 75, 1)
			var/mob/living/carbon/human/H = AM
			if(H:shoes.flags&NOSLIP)
				return
			else
				H.deal_damage(4, WEAKEN)
		return

	attack_self(mob/user as mob)
		if(!on)
			if(ishuman(user) && !user.stat)
				on = 1
				user << "You activate the slip sign."

/obj/item/weapon/caution/cone
	desc = "This cone is trying to warn you of something!"
	name = "warning cone"
	icon_state = "cone"

	suicide_act(mob/user)
		viewers(user) << "\red <b>[user] is yelling through the [src.name] very loudly! It looks like \he's trying to commit suicide.</b>"
		return (OXYLOSS)


/obj/item/weapon/rack_parts
	name = "rack parts"
	desc = "Parts of a rack."
	icon = 'icons/obj/items.dmi'
	icon_state = "rack_parts"
	flags = FPRINT | TABLEPASS| CONDUCT
	m_amt = 3750



/*/obj/item/weapon/syndicate_uplink
	name = "station bounced radio"
	desc = "Remain silent about this..."
	icon = 'icons/obj/radio.dmi'
	icon_state = "radio"
	var/temp = null
	var/uses = 10.0
	var/selfdestruct = 0.0
	var/traitor_frequency = 0.0
	var/mob/currentUser = null
	var/obj/item/device/radio/origradio = null
	flags = FPRINT | TABLEPASS | CONDUCT | ONBELT
	w_class = 2.0
	item_state = "radio"
	throw_speed = 4
	throw_range = 20
	m_amt = 100
	origin_tech = "magnets=2;syndicate=3"*/

/obj/item/weapon/SWF_uplink
	name = "station-bounced radio"
	desc = "used to comunicate it appears."
	icon = 'icons/obj/radio.dmi'
	icon_state = "radio"
	var/temp = null
	var/uses = 4.0
	var/selfdestruct = 0.0
	var/traitor_frequency = 0.0
	var/obj/item/device/radio/origradio = null
	flags = FPRINT | TABLEPASS| CONDUCT
	slot_flags = SLOT_BELT
	item_state = "radio"
	w_class = 2.0
	origin_tech = "magnets=1"

/obj/item/weapon/staff
	name = "wizards staff"
	desc = "A staff used by a wizard."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "staff"
	force = DAMAGE_LOW
	w_class = 2.0
	flags = FPRINT | TABLEPASS | NOSHIELD
	attack_verb = list("bludgeoned", "whacked", "disciplined")

	suicide_act(mob/user)
		viewers(user) << "\red <b>[user] has cast a deadly spell! It looks like \he's trying to commit suicide.</b>"
		return (OXYLOSS)

/obj/item/weapon/staff/broom
	name = "broom"
	desc = "Used for sweeping, and flying into the night while cackling. Black cat not included."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "broom"

/obj/item/weapon/staff/stick
	name = "stick"
	desc = "A great tool to drag someone else's drinks across the bar."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "stick"
	item_state = "stick"


/obj/item/weapon/table_parts
	name = "table parts"
	desc = "Parts of a table. Poor table."
	gender = PLURAL
	icon = 'icons/obj/items.dmi'
	icon_state = "table_parts"
	m_amt = 3750
	flags = FPRINT | TABLEPASS| CONDUCT
	attack_verb = list("slammed", "bashed", "battered", "bludgeoned", "thrashed", "whacked")

/obj/item/weapon/table_parts/reinforced
	name = "reinforced table parts"
	desc = "Hard table parts. Well...harder..."
	icon = 'icons/obj/items.dmi'
	icon_state = "reinf_tableparts"
	m_amt = 7500
	flags = FPRINT | TABLEPASS| CONDUCT

/obj/item/weapon/table_parts/wood
	name = "wooden table parts"
	desc = "Keep away from fire."
	icon_state = "wood_tableparts"
	flags = null

/obj/item/weapon/wire
	desc = "This is just a simple piece of regular insulated wire."
	name = "wire"
	icon = 'icons/obj/power.dmi'
	icon_state = "item_wire"
	var/amount = 1.0
	var/laying = 0.0
	var/old_lay = null
	m_amt = 40
	attack_verb = list("whipped", "lashed", "disciplined", "tickled")

	suicide_act(mob/user)
		viewers(user) << "\red <b>[user] is strangling \himself with the [src.name]! It looks like \he's trying to commit suicide.</b>"
		return (OXYLOSS)

/obj/item/weapon/module
	icon = 'icons/obj/module.dmi'
	icon_state = "std_module"
	w_class = 2.0
	item_state = "electronic"
	flags = FPRINT|TABLEPASS|CONDUCT
	var/mtype = 1						// 1=electronic 2=hardware

/obj/item/weapon/module/card_reader
	name = "card reader module"
	icon_state = "card_mod"
	desc = "An electronic module for reading data and ID cards."

/obj/item/weapon/module/power_control
	name = "power control module"
	icon_state = "power_mod"
	desc = "Heavy-duty switching circuits for power control."

/obj/item/weapon/module/id_auth
	name = "\improper ID authentication module"
	icon_state = "id_mod"
	desc = "A module allowing secure authorization of ID cards."

/obj/item/weapon/module/cell_power
	name = "power cell regulator module"
	icon_state = "power_mod"
	desc = "A converter and regulator allowing the use of power cells."


/obj/item/weapon/syntiflesh
	name = "syntiflesh"
	desc = "Meat that appears...strange..."
	icon = 'icons/obj/food.dmi'
	icon_state = "meat"
	flags = FPRINT | TABLEPASS | CONDUCT
	w_class = 1.0
	origin_tech = "biotech=2"


/obj/item/weapon/hatchet
	name = "hatchet"
	desc = "A very sharp axe blade upon a short fibremetal handle. It has a long history of chopping things, but now it is used for chopping wood."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hatchet"
	flags = FPRINT | TABLEPASS | CONDUCT
	force = DAMAGE_MED
	forcetype = SLASH
	w_class = 3.0
	m_amt = 15000
	origin_tech = "materials=2;combat=1"
	attack_verb = list("chopped", "torn", "cut")
	hit_sound = 'sound/weapons/bladeslice.ogg'


/obj/item/weapon/scythe
	icon_state = "scythe0"
	name = "scythe"
	desc = "A sharp and curved blade on a long fibremetal handle, this tool makes it easy to reap what you sow."
	force = DAMAGE_HIGH
	forcetype = SLASH
	w_class = 4.0
	flags = FPRINT | TABLEPASS | NOSHIELD
	slot_flags = SLOT_BACK
	origin_tech = "materials=2;combat=2"
	attack_verb = list("chopped", "sliced", "cut", "reaped")

/obj/item/weapon/scythe/afterattack(atom/A, mob/user as mob)
	if(istype(A, /obj/effect/spacevine))
		for(var/obj/effect/spacevine/B in orange(A,1))
			if(prob(80))
				del B
		del A


/obj/item/weapon/pai_cable
	desc = "A flexible coated cable with a universal jack on one end."
	name = "data cable"
	icon = 'icons/obj/power.dmi'
	icon_state = "wire1"

	suicide_act(mob/user)
		viewers(user) << pick("\red <b>[user] appears to be hanging theirselves!</b>", \
							"\red <b>[user] appears to be hanging theirselves!</b>")
		return (BRUTELOSS)

	var/obj/machinery/machine

/obj/item/weapon/plastique
	name = "plastic explosives"
	desc = "Used to put holes in specific areas without too much extra hole."
	gender = PLURAL
	icon = 'icons/obj/assemblies.dmi'
	icon_state = "plastic-explosive0"
	item_state = "plasticx"
	flags = FPRINT | TABLEPASS | USEDELAY
	w_class = 2.0
	origin_tech = "syndicate=2"
	var/timer = 10
	var/atom/target = null



/obj/item/weapon/plastique/mining
	name = "mining charge"
	desc = "State of the art 'mine it for you technology'."
	gender = PLURAL
	icon = 'icons/obj/assemblies.dmi'
	icon_state = "plastic-explosive0"
	item_state = "plasticx"
	flags = FPRINT | TABLEPASS | USEDELAY
	w_class = 2.0


///////////////////////////////////////Stock Parts /////////////////////////////////

/obj/item/weapon/stock_parts
	name = "stock part"
	desc = "What?"
	gender = PLURAL
	icon = 'icons/obj/stock_parts.dmi'
	w_class = 2.0
	var/rating = 1
	New()
		src.pixel_x = rand(-5.0, 5)
		src.pixel_y = rand(-5.0, 5)

//Rank 1

/obj/item/weapon/stock_parts/console_screen
	name = "console screen"
	desc = "Used in the construction of computers and other devices with a interactive console."
	icon_state = "screen"
	origin_tech = "materials=1"
	g_amt = 200

/obj/item/weapon/stock_parts/capacitor
	name = "capacitor"
	desc = "A basic capacitor used in the construction of a variety of devices."
	icon_state = "capacitor"
	origin_tech = "powerstorage=1"
	m_amt = 50
	g_amt = 50

/obj/item/weapon/stock_parts/scanning_module
	name = "scanning module"
	desc = "A compact, high resolution scanning module used in the construction of certain devices."
	icon_state = "scan_module"
	origin_tech = "magnets=1"
	m_amt = 50
	g_amt = 20

/obj/item/weapon/stock_parts/manipulator
	name = "micro-manipulator"
	desc = "A tiny little manipulator used in the construction of certain devices."
	icon_state = "micro_mani"
	origin_tech = "materials=1;programming=1"
	m_amt = 30

/obj/item/weapon/stock_parts/micro_laser
	name = "micro-laser"
	desc = "A tiny laser used in certain devices."
	icon_state = "micro_laser"
	origin_tech = "magnets=1"
	m_amt = 10
	g_amt = 20

/obj/item/weapon/stock_parts/matter_bin
	name = "matter bin"
	desc = "A container for hold compressed matter awaiting re-construction."
	icon_state = "matter_bin"
	origin_tech = "materials=1"
	m_amt = 80

//Rank 2

/obj/item/weapon/stock_parts/capacitor/adv
	name = "advanced capacitor"
	desc = "An advanced capacitor used in the construction of a variety of devices."
	origin_tech = "powerstorage=3"
	rating = 2
	m_amt = 50
	g_amt = 50

/obj/item/weapon/stock_parts/scanning_module/adv
	name = "advanced scanning module"
	desc = "A compact, high resolution scanning module used in the construction of certain devices."
	icon_state = "scan_module"
	origin_tech = "magnets=3"
	rating = 2
	m_amt = 50
	g_amt = 20

/obj/item/weapon/stock_parts/manipulator/nano
	name = "nano-manipulator"
	desc = "A tiny little manipulator used in the construction of certain devices."
	icon_state = "nano_mani"
	origin_tech = "materials=3,programming=2"
	rating = 2
	m_amt = 30

/obj/item/weapon/stock_parts/micro_laser/high
	name = "high-power micro-laser"
	desc = "A tiny laser used in certain devices."
	icon_state = "high_micro_laser"
	origin_tech = "magnets=3"
	rating = 2
	m_amt = 10
	g_amt = 20

/obj/item/weapon/stock_parts/matter_bin/adv
	name = "advanced matter bin"
	desc = "A container for hold compressed matter awaiting re-construction."
	icon_state = "advanced_matter_bin"
	origin_tech = "materials=3"
	rating = 2
	m_amt = 80

//Rating 3

/obj/item/weapon/stock_parts/capacitor/super
	name = "super capacitor"
	desc = "A super-high capacity capacitor used in the construction of a variety of devices."
	origin_tech = "powerstorage=5;materials=4"
	rating = 3
	m_amt = 50
	g_amt = 50

/obj/item/weapon/stock_parts/scanning_module/phasic
	name = "phasic scanning module"
	desc = "A compact, high resolution phasic scanning module used in the construction of certain devices."
	origin_tech = "magnets=5"
	rating = 3
	m_amt = 50
	g_amt = 20

/obj/item/weapon/stock_parts/manipulator/pico
	name = "pico-manipulator"
	desc = "A tiny little manipulator used in the construction of certain devices."
	icon_state = "pico_mani"
	origin_tech = "materials=5,programming=2"
	rating = 3
	m_amt = 30

/obj/item/weapon/stock_parts/micro_laser/ultra
	name = "ultra-high-power micro-laser"
	icon_state = "ultra_high_micro_laser"
	desc = "A tiny laser used in certain devices."
	origin_tech = "magnets=5"
	rating = 3
	m_amt = 10
	g_amt = 20

/obj/item/weapon/stock_parts/matter_bin/super
	name = "super matter bin"
	desc = "A container for hold compressed matter awaiting re-construction."
	icon_state = "super_matter_bin"
	origin_tech = "materials=5"
	rating = 3
	m_amt = 80





/obj/item/weapon/stock_parts/capacitor/adamantite
	name = "adamantite capacitor"
	desc = "A adamantite capacitor used in the construction of a variety of devices."
	origin_tech = "powerstorage=5;materials=4"
	rating = 4
	m_amt = 50
	g_amt = 50

/obj/item/weapon/stock_parts/scanning_module/adamantite
	name = "adamantite scanning module"
	desc = "A compact, high resolution phasic scanning module used in the construction of certain devices."
	origin_tech = "magnets=5"
	rating = 4
	m_amt = 50
	g_amt = 20


/obj/item/weapon/stock_parts/micro_laser/adamantite
	name = "adamantite micro-laser"
	icon_state = "ultra_high_micro_laser"
	desc = "A tiny laser used in certain devices."
	origin_tech = "magnets=5"
	rating = 4
	m_amt = 10
	g_amt = 20

/obj/item/weapon/stock_parts/matter_bin/adamantite
	name = "adamantite matter bin"
	desc = "A container for hold compressed matter awaiting re-construction."
	icon_state = "super_matter_bin"
	origin_tech = "materials=5"
	rating = 4
	m_amt = 80


/obj/item/weapon/ectoplasm
	name = "ectoplasm"
	desc = "spooky"
	gender = PLURAL
	icon = 'icons/obj/wizard.dmi'
	icon_state = "ectoplasm"

/obj/item/weapon/research//Makes testing much less of a pain -Sieve
	name = "research"
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "capacitor"
	desc = "A debug item for research."
	origin_tech = "materials=8;programming=8;magnets=8;powerstorage=8;bluespace=8;combat=8;biotech=8;syndicate=8"


/obj/item/weapon/research/mini
	desc = "Deconstruct this."
	origin_tech = "materials=4;programming=4;magnets=4;powerstorage=4;bluespace=4;combat=2;biotech=2;syndicate=2"

/obj/item/weapon/reapersythe
	icon_state = "scythe0"
	name = "scythe"
	desc = "Property of death, therefore the Death Squad."
	force = DAMAGE_HIGH
	forcetype = SLASH
	w_class = 4.0
	flags = FPRINT | TABLEPASS | NOSHIELD
	slot_flags = SLOT_BACK
	origin_tech = "materials=2;combat=2"
	attack_verb = list("chopped", "sliced", "cut", "reaped")

/obj/item/weapon/scythe/afterattack(atom/A, mob/user as mob)
	if(istype(A, /obj/effect/spacevine))
		for(var/obj/effect/spacevine/B in orange(A,1))
			if(prob(80))
				del B
		del A
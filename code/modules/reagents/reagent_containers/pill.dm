////////////////////////////////////////////////////////////////////////////////
/// Pills.
////////////////////////////////////////////////////////////////////////////////
/obj/item/weapon/reagent_containers/pill
	name = "pill"
	desc = "a pill."
	icon = 'icons/obj/chemical.dmi'
	icon_state = null
	item_state = "pill"
	possible_transfer_amounts = null
	volume = 50

	New()
		..()
		if(!icon_state)
			icon_state = "pill[rand(1,20)]"

	attack_self(mob/user as mob)
		return
	attack(mob/M as mob, mob/user as mob, def_zone)
		if(M == user)
			M << "\blue You swallow [src]."
			M.drop_from_inventory(src) //icon update
			if(reagents.total_volume)
				reagents.reaction(M, INGEST)
				spawn(5)
					reagents.trans_to(M, reagents.total_volume)
					del(src)
			else
				del(src)
			return 1

		else if(istype(M, /mob/living/carbon/human) )

			for(var/mob/O in viewers(world.view, user))
				O.show_message("\red [user] attempts to force [M] to swallow [src].", 1)

			if(!do_mob(user, M)) return

			user.drop_from_inventory(src) //icon update
			for(var/mob/O in viewers(world.view, user))
				O.show_message("\red [user] forces [M] to swallow [src].", 1)

			M.attack_log += text("\[[time_stamp()]\] <font color='orange'>Has been fed [src.name] by [user.name] ([user.ckey]) Reagents: [reagentlist(src)]</font>")
			user.attack_log += text("\[[time_stamp()]\] <font color='red'>Fed [src.name] by [M.name] ([M.ckey]) Reagents: [reagentlist(src)]</font>")


			log_attack("<font color='red'>[user.name] ([user.ckey]) fed [M.name] ([M.ckey]) with [src.name] (INTENT: [uppertext(user.a_intent)])</font>")

			if(reagents.total_volume)
				reagents.reaction(M, INGEST)
				spawn(5)
					reagents.trans_to(M, reagents.total_volume)
					del(src)
			else
				del(src)

			return 1

		return 0

	afterattack(obj/target, mob/user , flag)

		if(target.is_open_container() != 0 && target.reagents)
			if(!target.reagents.total_volume)
				user << "\red [target] is empty. Cant dissolve pill."
				return
			user << "\blue You dissolve the pill in [target]"
			reagents.trans_to(target, reagents.total_volume)
			for(var/mob/O in viewers(2, user))
				O.show_message("\red [user] puts something in [target].", 1)
			spawn(5)
				del(src)

		return

////////////////////////////////////////////////////////////////////////////////
/// Pills. END
////////////////////////////////////////////////////////////////////////////////

//Pills
/obj/item/weapon/reagent_containers/pill/antitox
	name = "Anti-toxins pill"
	desc = "Neutralizes many common toxins."
	icon_state = "pill17"
	New()
		..()
		reagents.add_reagent("anti_toxin", 50)

/obj/item/weapon/reagent_containers/pill/tox
	name = "Toxins pill"
	desc = "Highly toxic."
	icon_state = "pill5"
	New()
		..()
		reagents.add_reagent("toxin", 50)

/obj/item/weapon/reagent_containers/pill/cyanide
	name = "Cyanide pill"
	desc = "Don't swallow this."
	icon_state = "pill5"
	New()
		..()
		reagents.add_reagent("cyanide", 50)

/obj/item/weapon/reagent_containers/pill/adminordrazine
	name = "Adminordrazine pill"
	desc = "It's magic. We don't have to explain it."
	icon_state = "pill16"
	New()
		..()
		reagents.add_reagent("adminordrazine", 50)

/obj/item/weapon/reagent_containers/pill/stox
	name = "Sleeping pill"
	desc = "Commonly used to treat insomnia."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent("stoxin", 30)

/obj/item/weapon/reagent_containers/pill/kelotane
	name = "Kelotane pill"
	desc = "Used to treat burns."
	icon_state = "pill11"
	New()
		..()
		reagents.add_reagent("kelotane", 30)

/obj/item/weapon/reagent_containers/pill/inaprovaline
	name = "Inaprovaline pill"
	desc = "Used to stabilize patients."
	icon_state = "pill20"
	New()
		..()
		reagents.add_reagent("inaprovaline", 30)

/obj/item/weapon/reagent_containers/pill/dexalin
	name = "Dexalin pill"
	desc = "Used to treat oxygen deprivation."
	icon_state = "pill16"
	New()
		..()
		reagents.add_reagent("dexalin", 30)

/obj/item/weapon/reagent_containers/pill/bicaridine
	name = "Bicaridine pill"
	desc = "Used to treat physical injuries."
	icon_state = "pill18"
	New()
		..()
		reagents.add_reagent("bicaridine", 30)


////////////////////////////////////////////////////////////////////////////////
/// Scooters custom pills
////////////////////////////////////////////////////////////////////////////////



/obj/item/weapon/reagent_containers/pill/inspectionites
	name = "Ass-X"
	desc = "Pain in the ass indeed.."
	icon_state = "pill15"
	New()
		..()
		reagents.add_reagent("inspectionites", 10)

/obj/item/weapon/reagent_containers/pill/inspectionitesplacebo
	name = "Ass-X"
	desc = "Pain in the ass indeed.."
	icon_state = "pill15"
	New()
		..()
		reagents.add_reagent("inspectionitesplacebo", 10)


/obj/item/weapon/reagent_containers/pill/synaptizine
	name = "Synaptizine pill"
	desc = "Used to heal mindbreaker toxin and other stuff."
	icon_state = "pill11"
	New()
		..()
		reagents.add_reagent("synaptizine", 30)

/obj/item/weapon/reagent_containers/pill/stoxin2
	name = "Soporific pill"
	desc = "Put the person to sleep and heal them."
	icon_state = "pill11"
	New()
		..()
		reagents.add_reagent("stoxin2", 30)


/obj/item/weapon/reagent_containers/pill/sero
	name = "Serotonium pill"
	desc = "I bet it takes 1 unit of mindbreaker, 1 ryetalyn and 5 units of catalyst plasma to make."
	icon_state = "pill11"
	New()
		..()
		reagents.add_reagent("serotrotium", 30)

/obj/item/weapon/reagent_containers/pill/electrozene
	name = "Electrozene pill"
	desc = "A wise man once said: sodiumchloride, ethylredoxrazine, radium, plasma!"
	icon_state = "pill11"
	New()
		..()
		reagents.add_reagent("electrozene", 30)

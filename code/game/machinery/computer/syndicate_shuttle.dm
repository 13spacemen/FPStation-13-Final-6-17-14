#define SYNDICATE_SHUTTLE_MOVE_TIME 240
#define SYNDICATE_SHUTTLE_COOLDOWN 200

/obj/machinery/computer/syndicate_station
	name = "syndicate shuttle terminal"
	icon = 'icons/obj/computer.dmi'
	icon_state = "syndishuttle"
	damage_resistance = -1//Generally should not be broken
	var/area/curr_location
	var/moving = 0
	var/lastMove = 0


	New()
		curr_location= locate(/area/syndicate_station/start)


	proc/syndicate_move_to(area/destination as area)
		if(moving)	return
		if(lastMove + SYNDICATE_SHUTTLE_COOLDOWN > world.time)	return
		var/area/dest_location = locate(destination)
		if(curr_location == dest_location)	return

		moving = 1
		lastMove = world.time

		if(curr_location.z != dest_location.z)
			var/area/transit_location = locate(/area/syndicate_station/transit)
			curr_location.move_contents_to(transit_location)
			curr_location = transit_location
			sleep(SYNDICATE_SHUTTLE_MOVE_TIME)

		curr_location.move_contents_to(dest_location)
		curr_location = dest_location
		moving = 0
		return 1


	attackby(obj/item/I as obj, mob/user as mob)
		return attack_hand(user)

	attack_ai(mob/user as mob)
		return attack_hand(user)

	attack_paw(mob/user as mob)
		return attack_hand(user)

	attack_hand(mob/user as mob)
		var/allowed = 0
		if(user && user.mind && user.mind.special_role == "Syndicate")
			allowed = 1
		if(!allowed)
			user << "\red Access Denied"
			return

		user.set_machine(src)

		var/dat = {"Location: [curr_location]<br>
		Ready to move[max(lastMove + SYNDICATE_SHUTTLE_COOLDOWN - world.time, 0) ? " in [max(round((lastMove + SYNDICATE_SHUTTLE_COOLDOWN - world.time) * 0.1), 0)] seconds" : ": now"]<br>
		<a href='?src=\ref[src];syndicate=1'>Syndicate Space</a><br>
		<a href='?src=\ref[src];station_n=1'>North of SS13</a> |
		<a href='?src=\ref[src];station_s=1'>South of SS13</a> |
		<a href='?src=\ref[user];mach_close=computer'>Close</a>"}

/* Old movement locations
	<a href='?src=\ref[src];station_nw=1'>North West of SS13</a> |
	<a href='?src=\ref[src];station_n=1'>North of SS13</a> |
	<a href='?src=\ref[src];station_ne=1'>North East of SS13</a><br>
	<a href='?src=\ref[src];station_sw=1'>South West of SS13</a> |
	<a href='?src=\ref[src];station_s=1'>South of SS13</a> |
	<a href='?src=\ref[src];station_se=1'>South East of SS13</a><br>
	<a href='?src=\ref[src];commssat=1'>West of the DJ Station</a> |
	<a href='?src=\ref[src];mining=1'>North East of the Mining Asteroid</a><br>
	else if(href_list["station_nw"])
		syndicate_move_to(/area/syndicate_station/northwest)
	else if(href_list["station_ne"])
		syndicate_move_to(/area/syndicate_station/northeast)
	else if(href_list["station_sw"])
		syndicate_move_to(/area/syndicate_station/southwest)
	else if(href_list["station_se"])
		syndicate_move_to(/area/syndicate_station/southeast)
*/
		user << browse(dat, "window=computer;size=575x450")
		onclose(user, "computer")
		return


	Topic(href, href_list)
		if(!isliving(usr))	return
		var/mob/living/user = usr

		if(in_range(src, user) || istype(user, /mob/living/silicon))
			user.set_machine(src)

		if(href_list["syndicate"])
			var/timing = 0
			var/safety = 0
			if(src.z != 2)
				for(var/obj/machinery/nuclearbomb/bomb in world)
					if(!bomb.timing)
						continue
					timing = 1
					if(bomb.safety)
						continue
					safety = 1
			if(!timing)
				usr << "\red The bomb is not armed, shuttle is unable to leave!"
				return
			if(!safety)
				usr << "\red The bomb safety is ACTIVE, the bomb will not detonate!"
				return
			syndicate_move_to(/area/syndicate_station/start)
		else if(href_list["station_n"])
			syndicate_move_to(/area/syndicate_station/north)
		else if(href_list["station_s"])
			syndicate_move_to(/area/syndicate_station/south)

		add_fingerprint(usr)
		updateUsrDialog()
		return


	bullet_act(var/obj/item/projectile/Proj)
		visible_message("[Proj] ricochets off [src]!")
		return


	ex_act(var/severity)
		return 0
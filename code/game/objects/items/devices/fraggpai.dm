/obj/item/device/paicard/fraggpai
	name = "personal AI device"
	icon = 'icons/obj/pda.dmi'
	icon_state = "pai"
	item_state = "electronic"
	w_class = 2.0
	flags = FPRINT | TABLEPASS
	slot_flags = SLOT_BELT
	origin_tech = "programming=2"
	var/state = 0
	var/mob/living/silicon/pai/linkedpai = null

/obj/item/device/paicard/fraggpai/attack_self(mob/user)
	if (!in_range(src, user))
		return
	user.set_machine(src)
	var/dat = "<TT><B>Personal AI Device</B><BR>"
	if(pai && (!pai.master_dna || !pai.master))
		dat += "<a href='byond://?src=\ref[src];setdna=1'>Imprint Master DNA</a><br>"
	if(pai)
		dat += "Installed Personality: [pai.name]<br>"
		dat += "Prime directive: <br>[pai.pai_law0]<br>"
		dat += "Additional directives: <br>[pai.pai_laws]<br>"
		dat += "<a href='byond://?src=\ref[src];setlaws=1'>Configure Directives</a><br>"
		if(state)
			dat += {"<A href='byond://?src=\ref[src];choice=Summon'>Summon pAI</A>"}
		else
			dat += {"<A href='byond://?src=\ref[src];choice=Banish'>Banish pAI</A>"}
		dat += "<br>"
		dat += "<h3>Device Settings</h3><br>"
		if(radio)
			dat += "<b>Radio Uplink</b><br>"
			dat += "Transmit: <A href='byond://?src=\ref[src];wires=4'>[(radio.wires & 4) ? "Enabled" : "Disabled"]</A><br>"
			dat += "Receive: <A href='byond://?src=\ref[src];wires=2'>[(radio.wires & 2) ? "Enabled" : "Disabled"]</A><br>"
			dat += "Signal Pulser: <A href='byond://?src=\ref[src];wires=1'>[(radio.wires & 1) ? "Enabled" : "Disabled"]</A><br>"
		else
			dat += "<b>Radio Uplink</b><br>"
			dat += "<font color=red><i>Radio firmware not loaded. Please install a pAI personality to load firmware.</i></font><br>"
		dat += "<A href='byond://?src=\ref[src];wipe=1'>\[Wipe current pAI personality\]</a><br>"
	else
		if(looking_for_personality)
			dat += "Searching for a personality..."
			dat += "<A href='byond://?src=\ref[src];request=1'>\[View available personalities\]</a><br>"
		else
			dat += "No personality is installed.<br>"
			dat += "<A href='byond://?src=\ref[src];request=1'>\[Request personal AI personality\]</a><br>"
			dat += "Each time this button is pressed, a request will be sent out to any available personalities. Check back often and alot time for personalities to respond. This process could take anywhere from 15 seconds to several minutes, depending on the available personalities' timeliness."
	user << browse(dat, "window=paicard")
	onclose(user, "paicard")
	return

/obj/item/device/paicard/fraggpai/Topic(href, href_list)

	if(!usr || usr.stat)
		return

	if(href_list["setdna"])
		if(pai.master_dna)
			return
		var/mob/M = usr
		if(!istype(M, /mob/living/carbon))
			usr << "<font color=blue>You don't have any DNA, or your DNA is incompatible with this device.</font>"
		else
			var/datum/dna/dna = usr.dna
			pai.master = M.real_name
			pai.master_dna = dna.unique_enzymes
			pai << "<font color = red><h3>You have been bound to a new master.</h3></font>"
	if(href_list["request"])
		src.looking_for_personality = 1
		paiController.findPAI(src, usr)
	if(href_list["wipe"])
		var/confirm = input("Are you CERTAIN you wish to delete the current personality? This action cannot be undone.", "Personality Wipe") in list("Yes", "No")
		if(confirm == "Yes")
			for(var/mob/M in src)
				M << "<font color = #ff0000><h2>You feel yourself slipping away from reality.</h2></font>"
				M << "<font color = #ff4d4d><h3>Byte by byte you lose your sense of self.</h3></font>"
				M << "<font color = #ff8787><h4>Your mental faculties leave you.</h4></font>"
				M << "<font color = #ffc4c4><h5>oblivion... </h5></font>"
				M.death(0)
			removePersonality()
	if(href_list["wires"])
		var/t1 = text2num(href_list["wires"])
		if (radio.wires & t1)
			radio.wires &= ~t1
		else
			radio.wires |= t1
	if(href_list["setlaws"])
		var/newlaws = copytext(sanitize(input("Enter any additional directives you would like your pAI personality to follow. Note that these directives will not override the personality's allegiance to its imprinted master. Conflicting directives will be ignored.", "pAI Directive Configuration", pai.pai_laws) as message),1,MAX_MESSAGE_LEN)
		if(newlaws)
			pai.pai_laws = newlaws
			pai << "Your supplemental directives have been updated. Your new directives are:"
			pai << "Prime Directive : <br>[pai.pai_law0]"
			pai << "Supplemental Directives: <br>[pai.pai_laws]"
	if(href_list["Summon"])
		for(var/mob/living/silicon/pai/pai in src)
			linkedpai = pai
			pai.status_flags &= ~GODMODE
			pai.canmove = 1
			pai << "<b>You have been released from your prison, but you are still bound to [master]'s will. Help them suceed in their goals at all costs.</b>"
			pai.loc = master.loc
			pai.cancel_camera()
	if(href_list["Banish"])
		linkedpai.status_flags &= ~GODMODE
		linkedpai.canmove = 0
		linkedpai << "<b>You have been released from your prison, but you are still bound to [master]'s will. Help them suceed in their goals at all costs.</b>"
		linkedpai.loc = master.loc
		linkedpai.cancel_camera()
	attack_self(usr)

// 		WIRE_SIGNAL = 1
//		WIRE_RECEIVE = 2
//		WIRE_TRANSMIT = 4

/obj/item/device/paicard/fraggpai/emp_act(severity)
	for(var/mob/M in src)
		M.emp_act(severity)
	..()











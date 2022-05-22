/mob/living/silicon/ai/examine()
	if(!usr || !src)	return
	if( (usr.sdisabilities & BLIND || usr.blinded || usr.stat) && !istype(usr,/mob/dead/observer) )
		usr << "<span class='notice'>Something is there but you can't see it.</span>"
		return

	var/msg = "<span class='info'>*---------*\nThis is \icon[src] <EM>[src]</EM>!\n"
	if (src.stat == DEAD)
		msg += "<span class='deadsay'>It appears to be powered-down.</span>\n"
	else
		msg += "<span class='warning'>"
		var/bruteloss = get_brute_loss()
		if(bruteloss > 0)
			if(bruteloss < 30)
				msg += "It looks slightly dented.\n"
			else
				msg += "<B>It looks severely dented!</B>\n"
		var/fireloss = get_fire_loss()
		if(fireloss > 0)
			if (fireloss < 30)
				msg += "It looks slightly charred.\n"
			else
				msg += "<B>Its casing is melted and heat-warped!</B>\n"

		if (src.stat == UNCONSCIOUS)
			msg += "It is non-responsive and displaying the text: \"RUNTIME: Sensory Overload, stack 26/3\".\n"
		msg += "</span>"
	msg += "*---------*</span>"

	usr << msg
	return
/datum/disease/appendicitis
	form = "Condition"
	name = "Appendicitis"
	max_stages = 3
	spread = "Acute"
	cure = "Surgery"
	agent = "Shitty Appendix"
	affected_species = list("Human")
	permeability_mod = 1
	contagious_period = 9001 //slightly hacky, but hey! whatever works, right?
	desc = "If left untreated the subject will become very weak, and may vomit often."
	severity = "Medium"
	longevity = 1000
	hidden = list(0, 1)

/datum/disease/appendicitis/stage_act()
	..()
	switch(stage)
		if(1)
			if(prob(5)) affected_mob.emote("cough")
		if(2)
			var/obj/item/organ/appendix/A = getappendix(affected_mob)
			if(A)
				A.inflamed = 1
				A.update_icon()
			if(prob(3))
				affected_mob << "<span class='warning'>You feel a stabbing pain in your abdomen!</span>"
				affected_mob.deal_damage(2, WEAKEN)
				affected_mob.deal_damage(1, TOX)
		if(3)
			if(prob(1))
				if (affected_mob.nutrition > 100)
					affected_mob.deal_damage(4, WEAKEN)
					affected_mob.visible_message("<span class='warning'>[affected_mob] throws up!</span>")
					playsound(affected_mob.loc, 'sound/effects/splat.ogg', 50, 1)
					var/turf/location = affected_mob.loc
					if(istype(location, /turf/simulated))
						location.add_vomit_floor(affected_mob)
					affected_mob.nutrition -= 95
					affected_mob.deal_damage(1, TOX)
				else
					affected_mob << "<span class='warning'>You gag as you want to throw up, but there's nothing in your stomach!</span>"
					affected_mob.deal_damage(10, WEAKEN)
					affected_mob.deal_damage(3, TOX)
/proc/captain_announce(var/text)
	world << "<h1 class='alert'>Priority Announcement</h1>"
	world << "<span class='alert'>[html_encode(text)]</span>"
	world << "<br>"

/proc/ert_announce(var/text)
	world << "<h1 class='alert'>ERT Announcement</h1>"
	world << "<span class='alert'>[html_encode(text)]</span>"
	world << "<br>"


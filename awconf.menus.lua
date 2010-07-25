-- file: awconf.menus.lua


-- ********************
-- Menus
-- ********************

io.stderr:write('\t--> Processing awconf.menus.lua ...\n')




-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                        { "open terminal", terminal },
                                        { "  ", "" },
                                        { "XFE", "xfe" },
                                        { "  ", "" },
                                        { "Firefox", "firefox" },
                                        { "Thunderbird", "thunderbird" },
                                        { "Pidgin", "pidgin" },
                                        { "  ", "" },
                                        { "VLC Player", "vlc" },
                                        { "Open Office", "soffice" },
                                        { "  ", "" },
                                        { "Mixer", "envy24control" },
                                      }
                            })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })


networkmenu = {
   { "Wg Wlan", "sudo netcfg wg-wlan-dhcp" },
   { "Jazz Wlan", "sudo netcfg gross-wlan-dhcp" },
   { "Tu Chemnitz", "sudo netcfg tuc-edurom" },
   { "Ethernet", "sudo netcfg ethdhcp" },
   { "", "" },
   { "All Interfaces Down", "sudo netcfg -a" },
}

cpufreqmenu = {
   { "1.20 GHz", "sudo /usr/local/bin/swcpufreq low" },
   { "1.60 GHz", "sudo /usr/local/bin/swcpufreq middle" },
   { "2.20 GHz", "sudo /usr/local/bin/swcpufreq high" },
}

powermenu = awful.menu({ items = {
		{ "Network Profiles", networkmenu }, 
		{ "Cpu Frequency", cpufreqmenu }, 
		{ "", "" }, 
		{ "Halt System", "sudo halt" }, 
		{ "Reboot System", "sudo reboot" }, 
		{ "Hibernate System", "sudo pm-hibernate" }, 
	},
	width = 160 ,
})


pmlauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = powermenu })


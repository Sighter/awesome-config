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

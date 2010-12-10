-- file: awconf.widgets.lua


-- ********************
-- Widgets
-- ********************

io.stderr:write('\t--> Processing awconf.widgets.lua ...\n')



-- Create a textclock widget
mytextclock = awful.widget.textclock()

-- add the calendar-functions
mytextclock.mouse_enter = function()
    add_calendar(0)
end
mytextclock.mouse_leave = remove_calendar

mytextclock:buttons({
    awful.button({ }, 4, function()
        add_calendar(-1)
    end),
    awful.button({ }, 5, function()
        add_calendar(1)
    end),
})

calendar2.addCalendarToWidget(mytextclock)



-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if not c:isvisible() then
                                                  awful.tag.viewonly(c:tags()[1])
                                              end
                                              client.focus = c
                                              c:raise()
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(mytextclock)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)


    mywibox[s]:set_widget(layout)
end

sightbox = {}


myn.brackl = '<span color="white">[</span>'
myn.brackr = '<span color="white">]</span>'
myn.space  = '   '




-- Filesystem - usage - widgets
-- root
fswidget_root_text = wibox.widget.textbox({ name = "feswidget_root_text"   })
vicious.register(fswidget_root_text, vicious.widgets.fs, 
myn.brackl .. '<span color="lightblue">Root:</span> ${/ used_gb} | <span color="white">${/ size_gb}</span>' .. myn.brackr , 120)
--awful.widget.layout.margins[fswidget_root_text] = { left = 6, right = 6}

-- var
fswidget_var_text = wibox.widget.textbox({ name = "feswidget_var_text"   })
vicious.register(fswidget_var_text, vicious.widgets.fs, 
myn.brackl .. '<span color="lightblue">Var:</span> ${/var used_gb} | <span color="white">${/var size_gb}</span>' .. myn.brackr , 120)
--awful.widget.layout.margins[fswidget_var_text] = { left = 6, right = 6}

-- home
fswidget_home_text = wibox.widget.textbox({ name = "feswidget_home_text"   })
vicious.register(fswidget_home_text, vicious.widgets.fs, 
myn.brackl .. '<span color="lightblue">Home:</span> ${/home used_gb} | <span color="white">${/home size_gb}</span>' .. myn.brackr , 120)
--awful.widget.layout.margins[fswidget_home_text] = { left = 6, right = 6}


-- CPU Useage
cpuwidget =	wibox.widget.textbox({ name = 'cpuwidget'})
vicious.register(cpuwidget, vicious.widgets.cpu, myn.brackl .. '<span color="lightblue">CPU:</span> $1% $2%' .. myn.brackr , 2)
--awful.widget.layout.margins[cpuwidget] = { left = 6, right = 6}
popular.addtowidget(cpuwidget, popular.cpufreqinfo.popup)

-- Battery
batwidget =	wibox.widget.textbox({ name = 'batwidget'})
vicious.register(batwidget, vicious.widgets.bat, myn.brackl .. '<span color="lightblue">Bat:</span> $2% $1 ' .. myn.brackr , 2, "BAT0")
--awful.widget.layout.margins[batwidget] = { left = 6, right = 6}

--[[ Thermal monitoring
-- CPU 1
cputherm1 =	wibox.widget.textbox({type = 'textbox',name = 'cputherm1'})
vicious.register(cputherm1, vicious.widgets.thermal , myn.brackl .. '<span color="lightblue">CPU Therm:</span> $1°', 2, {"coretemp.0","core"})
--awful.widget.layout.margins[cputherm1] = { left = 6}
-- CPU 2
cputherm2 =	wibox.widget.textbox({type = 'textbox',name = 'cputherm2'})
vicious.register(cputherm2, vicious.widgets.thermal ,' $1°', 2, {"coretemp.1","core"})
-- CPU 3
cputherm3 =	wibox.widget.textbox({type = 'textbox',name = 'cputherm3'})
vicious.register(cputherm3, vicious.widgets.thermal ,' $1°', 2, {"coretemp.2","core"})
-- CPU 4
cputherm4 =	wibox.widget.textbox({type = 'textbox',name = 'cputherm4'})
vicious.register(cputherm4, vicious.widgets.thermal , ' $1°' .. myn.brackr , 2, {"coretemp.3","core"})
--awful.widget.layout.margins[cputherm4] = { right = 6}

-- Thermal monitoring for hdds
hddtemp1 =	wibox.widget.textbox({type = 'textbox',name = 'hddtemp1'})
vicious.register(hddtemp1, vicious.widgets.hddtemp, myn.brackl .. '<span color="lightblue">Hddtemp:</span> ${/dev/sda}° | ${/dev/sdb}° ' .. myn.brackr , 2)
--awful.widget.layout.margins[hddtemp1] = { left = 6, right = 6}
--]]

-- Net Stats
netwidget =	wibox.widget.textbox({name = 'netwidget'})
netstat = io.popen("ifconfig"):read("*a")
if string.find(netstat,"wlan0") then
		vicious.register(netwidget, vicious.widgets.net, myn.brackl .. '<span color="lightblue">Wlan:</span> ${eth0 down_kb}/${eth0 up_kb}' .. myn.brackr,3)
else
		vicious.register(netwidget, vicious.widgets.net, myn.brackl .. '<span color="lightblue">Eth:</span> ${eth0 down_kb}/${eth0 up_kb}' .. myn.brackr,3)
end
--awful.widget.layout.margins[netwidget] = { left = 6, right = 6}


-- Pacman Updates
pacmwidget = wibox.widget.textbox({name = 'pacmwidget'})
vicious.register(pacmwidget, vicious.widgets.pkg, "$1" , 40, "Arch") 
--awful.widget.layout.margins[pacmwidget] = { right = 6}
pacmimage = wibox.widget.imagebox({name = 'pacmimage' })
pacmimage.set_image(pacmimage, "/home/sighter/.config/awesome/icons/pacman.png")

-- Mpd Playing song
mpdwidget = wibox.widget.textbox({name = 'mpdwidget' })
vicious.register(mpdwidget, vicious.widgets.mpd, '   ' ..  myn.brackl .. '<span color="lightblue">MPD:</span> ${Artist} - ${Title}' .. myn.brackr, 10)
--awful.widget.layout.margins[mpdwidget] = { left = 3, right = 6}


-- Volume Widget
volumewidget = wibox.widget.textbox({name = 'volumewidget' })
vicious.register(volumewidget, vicious.widgets.volume, myn.brackl .. '<span color="lightblue">Vol:</span> $1 $2' .. myn.brackr, 1, "Master")
--awful.widget.layout.margins[volumewidget] = { right = 6}

-- Create wibox
sightbox[1] = awful.wibox({ position = "bottom", screen = 1})

-- Widgets that are aligned to the left
local left_layout = wibox.layout.fixed.horizontal()
left_layout:add( wibox.layout.margin(cpuwidget, 2, 0, 2, 2) )
left_layout:add( wibox.layout.margin(fswidget_root_text, 10, 0, 2, 2) )
left_layout:add( wibox.layout.margin(fswidget_var_text, 10, 0, 2, 2) )
left_layout:add( wibox.layout.margin(fswidget_home_text, 10, 0, 2, 2) )

-- Widgets that are aligned to the right
local right_layout = wibox.layout.fixed.horizontal()
right_layout:add( wibox.layout.margin(batwidget, 0, 10, 2, 2) )
right_layout:add( wibox.layout.margin(pacmimage, 0, 2, 0, 0) )
right_layout:add( wibox.layout.margin(pacmwidget, 0, 10, 2, 2) )
right_layout:add( wibox.layout.margin(netwidget, 0, 10, 2, 2) )
right_layout:add( wibox.layout.margin(volumewidget, 0, 10, 2, 2) )
right_layout:add( wibox.layout.margin(pmlauncher, 0, 2, 2, 2) )


-- Now bring it all together
local layout = wibox.layout.align.horizontal()
layout:set_left(left_layout)
layout:set_right(right_layout)

sightbox[1]:set_widget(layout)

--[[ fill the wibox
sightbox[1].widgets = { 
		{
			cpuwidget,
			fswidget_root_text,
			fswidget_var_text,
			fswidget_home_text,
			layout = awful.widget.layout.horizontal.leftright,
		},
		{
			batwidget,
			pacmwidget,
			netwidget,
			volumewidget,
			pmlauncher,
			layout = awful.widget.layout.horizontal.rightleft,
		},
		layout = awful.widget.layout.horizontal.leftright,
        height = sightbox[1].height
}
--]]


sightbox[1].screen = 1



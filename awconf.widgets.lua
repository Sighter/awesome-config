-- file: awconf.widgets.lua


-- ********************
-- Widgets
-- ********************

io.stderr:write('\t--> Processing awconf.widgets.lua ...\n')



-- Create a textclock widget
mytextclock = awful.widget.textclock({ align = "right" })

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

-- Create a systray
mysystray = widget({ type = "systray" })

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

    -- Create a table with widgets that go to the right
    right_aligned = {
        layout = awful.widget.layout.horizontal.rightleft
    }
    if s == 1 then table.insert(right_aligned, mysystray) end
    table.insert(right_aligned, mytextclock)
    table.insert(right_aligned, mylayoutbox[s])

    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        mylauncher,
        mytaglist[s],
        mypromptbox[s],
        right_aligned,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.leftright,
        height = mywibox[s].height
    }
end

-- clone the tasklist

--mytasklist_bak = mytasklist[1]

-- create a cloned wibox
--[[
mywibox[3] = wibox({ position = "top", fg = beautiful.fg_normal, bg = beautiful.bg_normal })

mywibox[3].widgets = { mylauncher,
                       mytaglist[1],
                       mytasklist[1],
                       mypromptbox[1],
                       mytextbox,
                       mylayoutbox[1],
                       1 == 1 and mysystray or nil }
--]]


-- Create the second Wibox on Screen ONE 
-- #####################################

-- create the sightbox-table
---[[
sightbox = {}


myn.brackl = '<span color="white">[</span>'
myn.brackr = '<span color="white">]</span>'
myn.space  = '   '




-- Filesystem - usage - widgets
fswidget_root_text = widget({ type = 'textbox' ,align = "left" ,name = "feswidget_root_text"   })
vicious.register(fswidget_root_text, vicious.widgets.fs, 
myn.brackl .. '<span color="lightblue">Root:</span> ${/ used}/${/ size}//<span color="white">${/ avail}</span>' .. myn.brackr , 120)
awful.widget.layout.margins[fswidget_root_text] = { left = 6, right = 6}

fswidget_win2_text = widget({ type = 'textbox' ,align = "left" ,name = "feswidget_win2_text"   })
vicious.register(fswidget_win2_text, vicious.widgets.fs, 
myn.brackl .. '<span color="lightblue">Win 2:</span> ${/media/win2 used}/${/media/win2 size}//<span color="white">${/media/win2 avail}</span>' .. myn.brackr , 120)
awful.widget.layout.margins[fswidget_win2_text] = { left = 6, right = 6}

fswidget_win3_text = widget({ type = 'textbox' , align = 'left' ,name = "feswidget_win3_text"   })
vicious.register(fswidget_win3_text, vicious.widgets.fs, 
myn.brackl .. '<span color="lightblue">Win 3:</span> ${/media/win3 used}/${/media/win3 size}//<span color="white">${/media/win3 avail}</span>' .. myn.brackr , 120)
awful.widget.layout.margins[fswidget_win3_text] = { left = 6, right = 6}

fswidget_bar1_text = widget({ type = 'textbox' , align = 'left' ,name = "feswidget_bar1_text"   })
vicious.register(fswidget_bar1_text, vicious.widgets.fs, 
myn.brackl .. '<span color="lightblue">Barr 1:</span> ${/media/barracuda1 used}/${/media/barracuda1 size}//<span color="white">${/media/barracuda1 avail}</span>' .. myn.brackr , 120)
awful.widget.layout.margins[fswidget_bar1_text] = { left = 6, right = 6}


-- CPU Useage
cpuwidget =	widget({type = 'textbox',name = 'cpuwidget'})
vicious.register(cpuwidget, vicious.widgets.cpu, myn.brackl .. '<span color="white">CPU:</span> $1% $2%' .. myn.brackr , 2)
awful.widget.layout.margins[cpuwidget] = { left = 6, right = 6}


-- Net Stats
netwidget =	widget({type = 'textbox',name = 'netwidget'})
vicious.register(netwidget, vicious.widgets.net, myn.brackl .. '<span color="lightblue">Net:</span> ${eth0 down_kb}/${eth0 up_kb}' .. myn.brackr,3)
awful.widget.layout.margins[netwidget] = { left = 6, right = 6}


-- Pacman Updates
pacmwidget = widget({type = 'textbox',name = 'pacmwidget'})
vicious.register(pacmwidget, vicious.widgets.pacman, "$1" ,40 ) 
awful.widget.layout.margins[pacmwidget] = { right = 6}
pacmimage = widget({ type = 'imagebox' , name = 'pacmimage'})
pacmimage.image = image("/home/sighter/.config/awesome/icons/pacman.png")


-- Mpd Playing song
mpdwidget = widget({ type = 'textbox', name = 'mpdwidget' })
vicious.register(mpdwidget, vicious.widgets.mpd, '   ' ..  myn.brackl .. '<span color="lightblue">MPD:</span> $1 ' .. myn.brackr, 10)


-- Volume Widget
volumewidget = widget({ type = 'textbox', name = 'volumewidget' })
volumewidget.text = vol_get()
volimage = widget({ type = 'imagebox' , name = 'volimage'})
volimage.image = image("/home/sighter/.config/awesome/icons/vol.png")


-- Launchbar
launchbar = {}
launchbar.krusaderimg = image("/home/sighter/.config/awesome/icons/krusader64x64.png"):crop(4,4,10,10)
launchbar.krusader = awful.widget.launcher.new({ image = launchbar.krusaderimg , command = "krusader" })



-- fill the wibox
sightbox[1] = awful.wibox({ position = "bottom", fg = beautiful.fg_normal, bg = beautiful.bg_normal, screen = 1})
sightbox[2] = awful.wibox({ position = "bottom", fg = beautiful.fg_normal, bg = beautiful.bg_normal, screen = 2})
sightbox[1].widgets = { 
		{
			fswidget_root_text,
			--fswidget_win2_text,
			--fswidget_win3_text,
			fswidget_bar1_text,
			launchbar.krusader,
			layout = awful.widget.layout.horizontal.leftright,
		},
		{
			pacmimage,
			pacmwidget,
			cpuwidget,
			netwidget,
			layout = awful.widget.layout.horizontal.rightleft,
		},
		layout = awful.widget.layout.horizontal.leftright,
        height = sightbox[1].height
}

sightbox[2].widgets = {
		{
			volimage,
			volumewidget,
			mpdwidget,
			layout = awful.widget.layout.horizontal.leftright,
		},
		layout = awful.widget.layout.horizontal.leftright,
        height = sightbox[2].height
}
				





-- place it on screen one
sightbox[1].screen = 1



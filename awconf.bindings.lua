-- file: awconf.bindings.lua


-- ********************
-- Key Bindings
-- ********************

io.stderr:write('\t--> Processing awconf.bindings.lua ...\n')


-- Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

-- Key bindings
globalkeys = awful.util.table.join(

    awful.key({ modkey,           }, "h",   awful.tag.viewprev   ),
    awful.key({ modkey,           }, "l",   awful.tag.viewnext   ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
	    	warptofocus(true)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
	    	warptofocus(true)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show(true)        	end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function ()	awful.client.swap.byidx(  1)end),
    awful.key({ modkey, "Shift"   }, "k", function () 	awful.client.swap.byidx( -1)end),
    awful.key({ modkey, "Shift"   }, "l", function () 	awful.screen.focus_relative( 1)
														warptofocus(true)			end),
    awful.key({ modkey, "Shift"   }, "h", function () 	awful.screen.focus_relative(-1)
														warptofocus(true)			end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "n",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "u",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "u",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "n",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),
	
	-- launch quick floating console
    awful.key({ modkey,           }, "b", function () os.execute(terminal .. " -n urxvt-short -e hire /home/sighter/notes.txt") end),
	
	-- Google Search
    awful.key({ modkey }, "F5", function () os.execute("firefox \'http://www.google.com/search?q=\'\"$(xsel)\"") end),
	
	-- Beolingus Search
    awful.key({ modkey }, "F6", function () os.execute("firefox \'http://dict.tu-chemnitz.de/dings.cgi?lang=en&service=deen&opterrors=0&optpro=0&query=\'\"$(xsel)\"\'&iservice=&comment=&email=\'") end),
	
	-- wikipedia Search
    awful.key({ modkey }, "F7", function () os.execute("firefox \'http://de.wikipedia.org/wiki/Spezial:Search?ns0=1&search=\'\"$(xsel)\"\'&fulltext=Suche\'") end),

	-- Volume Control
    awful.key({ nil }, "XF86AudioLowerVolume", 	function () vol_change(-2) end),
    awful.key({ nil }, "XF86AudioRaiseVolume", 	function () vol_change(2) end),
    awful.key({ nil }, "XF86AudioPlay", 		function () os.execute("mpc toggle > /dev/null")end),

    -- Prompt
    awful.key({ modkey }, "r",  function () mypromptbox[mouse.screen]:run() end),

	-- Lua Prompt
    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
	
	-- Dictionary Prompt
	awful.key({ modkey}, "d",
		function ()
			info = true
			local f = io.popen("dict -d wn $(xsel) 2>&1")
			local fr = ""
			for line in f:lines() do
				fr = fr .. line .. '\n'
			end
			f:close()
			naughty.notify({ text = '<span font_desc="Sans 7">'..fr..'</span>', timeout = 0, width = 400 })
	end),
	
	-- get some Infos about tags
    awful.key({ modkey }, "F1",
		function ()
			local s = mouse.screen
			local t = awful.tag.selected(s)
    		naughty.notify({ text = awful.tag.getmwfact(t) .. "\n" .. awful.tag.getncol(t) , timeout = 10 })
	end),

	-- Get Client Coordinates
    awful.key({ modkey }, "F2",
		function ()
			local c = client.focus
			local coord = c.geometry(c)
			local scoord = ""
			for i,v in pairs(coord) do
					scoord = scoord .. i .. " :: " .. v .. "\n"
			end
    		naughty.notify({ text = scoord , timeout = 10 })
			sightness.sayhello()
	end),
	
	-- Get Client Coordinates
    awful.key({ modkey }, "F3",
		function ()
			local c = client.focus
			geo = { x = 500 , y = 100, height = 200, width = 200}
			c:geometry(geo)
	end),

    -- Key to get Information about a CLient
    awful.key({ modkey, "Ctrl" }, "i",
    	function ()
            local s = mouse.screen
              if mypromptbox[s].text then
		mypromptbox[s].text = nil
              elseif client.focus then
                mypromptbox[s].text = nil
                  if client.focus.class then
                      mypromptbox[s].text = "Class: " .. client.focus.class .. " "
                  end
                  if client.focus.instance then
                    mypromptbox[s].text = mypromptbox[s].text .. "Instance: ".. client.focus.instance .. " "
                  end
                  if client.focus.role then
                    mypromptbox[s].text = mypromptbox[s].text .. "Role: ".. client.focus.role
                  end
                  if client.focus.icon_name then
                    mypromptbox[s].text = mypromptbox[s].text .. "Title: ".. client.focus.icon_name
	     	end
              end
	end)
)

-- Client awful tagging: this is useful to tag some clients and then do stuff like move to tag on them
clientkeys = awful.util.table.join(

    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, 	    }, "e",  	 function () dofile("/home/sighter/.config/awesome/clientmenu.lua")  end),
    awful.key({ modkey, 	    }, "c",  	 function () awful.client.cycle(true) end),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey }, "t", awful.client.togglemarked),
    awful.key({ modkey,}, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9

---[[
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "F" .. i,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          for k, c in pairs(awful.client.getmarked()) do
                              awful.client.movetotag(tags[screen][i], c)
                          end
                      end
                   end))
end
--]]


clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)


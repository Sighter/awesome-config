
-- file: awconf.tags.lua


-- ********************
-- Tag definitions
-- ********************

io.stderr:write('\t--> Processing awconf.tags.lua ...\n')


-- Define the tag-names
---[[

tagnames={
	{ " 1:Com ", " 2:Mail ",  " 3:Mas ",   " 4:Mas ", " 5:Mas ",    " 6:FM ", " 7:Misc " },
	{ " 1:WWW ", " 2:News ",  " 3:Docs ",   " 4:var ", " 5:Sound ", " 6:Logs " }
}


-- Define tags table.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tagnames[s], s)
end

-- Set default-layouts
awful.layout.set(layouts[4], tags[1][1])
awful.layout.set(layouts[9], tags[1][2])
awful.layout.set(layouts[4], tags[1][3])
awful.layout.set(layouts[4], tags[1][4])
awful.layout.set(layouts[4], tags[1][5])
awful.layout.set(layouts[4], tags[1][6])

awful.layout.set(layouts[9], tags[2][1])
awful.layout.set(layouts[9], tags[2][2])
awful.layout.set(layouts[9], tags[2][3])
awful.layout.set(layouts[4], tags[2][4])
awful.layout.set(layouts[4], tags[2][5])
awful.layout.set(layouts[12], tags[2][6])

awful.tag.setmwfact(0.5, tags[1][1])
awful.tag.setmwfact(0.8, tags[1][2])
awful.tag.setmwfact(0.8, tags[1][3])
awful.tag.setmwfact(0.8, tags[1][4])
awful.tag.setmwfact(0.8, tags[1][5])
awful.tag.setmwfact(0.8, tags[1][6])
--]]


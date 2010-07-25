
-- file: awconf.tags.lua


-- ********************
-- Tag definitions
-- ********************

io.stderr:write('\t--> Processing awconf.tags.lua ...\n')


-- Define the tag-names
---[[

tagnames={
	{ 	" 1:Com ",
		" 2:Mail ",
		" 3:WWW ",  
		" 4:Mas ",
		" 5:Mas " ,
		" 6:Mas " ,
		" 7:Docs " ,
		" 8:Misc " ,
		" 9:FM ",
		" 10:Logs " },
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
awful.layout.set(layouts[9], tags[1][3])
awful.layout.set(layouts[4], tags[1][4])
awful.layout.set(layouts[4], tags[1][5])
awful.layout.set(layouts[4], tags[1][6])
awful.layout.set(layouts[9], tags[1][7])
awful.layout.set(layouts[4], tags[1][8])
awful.layout.set(layouts[4], tags[1][9])
awful.layout.set(layouts[4], tags[1][10])

awful.tag.setmwfact(0.5, tags[1][1])
awful.tag.setmwfact(0.8, tags[1][2])
awful.tag.setmwfact(0.8, tags[1][3])
awful.tag.setmwfact(0.8, tags[1][4])
awful.tag.setmwfact(0.8, tags[1][5])
awful.tag.setmwfact(0.8, tags[1][6])
--]]



-- file: awconf.tags.lua


-- ********************
-- Tag definitions
-- ********************

io.stderr:write('\t--> Processing awconf.tags.lua ...\n')


-- Define the tag-names
---[[

tagnames={
	{ " Com ", " WWW ",  " Mas ",   " Mas " ,  " FM ", " Logs " },
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

awful.tag.setmwfact(0.5, tags[1][1])
awful.tag.setmwfact(0.8, tags[1][2])
awful.tag.setmwfact(0.8, tags[1][3])
awful.tag.setmwfact(0.8, tags[1][4])
awful.tag.setmwfact(0.8, tags[1][5])
awful.tag.setmwfact(0.8, tags[1][6])
--]]


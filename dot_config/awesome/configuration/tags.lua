local awful = require("awful")
local names = {"󱓞 1", "󰈮 2", " 3", "󰇮 4", "󰦑 5", "󰭻 6", "󰝚 7", "󱛉 8", "󰊴 9", "󰖟 10"}

-- Each screen has its own tag table.
local l = awful.layout.suit -- Just to save some typing: use an alias.
local layouts = {
    -- Tag 1
    l.floating,
    -- Tag 2
    l.fair,
    -- Tag 3
    l.fair,
    -- Tag 4
    l.tile,
    -- Tag 5
    l.tile,
    -- Tag 6
    l.tile,
    -- Tag 7
    l.tile,
    -- Tag 8
    l.fair,
    -- Tag 9
    l.tile,
    -- Tag 10
    l.fair
}

--- Set tags
screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag(names, s, layouts)
end)

return {
  names = names,
  layouts = layouts
}

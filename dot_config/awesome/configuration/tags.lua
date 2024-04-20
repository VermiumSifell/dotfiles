local awful = require("awful")
local names = {"󱓞 1", "󰈮 2", " 3", "󰇮 4", "󰦑 5", "󰭻 6", "󰝚 7", "󱛉 8", "󰊴 9", "󰖟 10"}

--- Layouts
local l = awful.layout.suit -- Just to save some typing: use an alias.
local layouts = {
    l.floating,
    l.fair,
    l.fair,
    l.tile,
    l.tile,
    l.max,
    l.tile,
    l.fair,
    l.tile,
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

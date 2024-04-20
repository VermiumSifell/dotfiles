local awful = require("awful")
local layouts = require("configuration.layout")
local names = {"󱓞 1", "󰈮 2", " 3", "󰇮 4", "󰦑 5", "󰭻 6", "󰝚 7", "󱛉 8", "󰊴 9", "󰖟 10"}

--- Set tags
screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag(names, s, layouts)
end)

return {
  names = names,
  layouts = layouts
}

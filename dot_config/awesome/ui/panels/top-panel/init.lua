local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local apps = require("configuration.apps")

--- Widgets
local taglist_widget = require("ui.panels.top-panel.taglist")
local layoutbox_widget = require("ui.panels.top-panel.layoutbox")
local memory_widget = require("ui.panels.top-panel.memory")
local cpu_widget = require("ui.panels.top-panel.cpu")
local wifi_widget = require("ui.panels.top-panel.wifi")
local battery_widget = require("ui.panels.top-panel.battery")
local ethernet_widget = require("ui.panels.top-panel.ethernet")
local systray_widget = require("ui.panels.top-panel.systray")
local date_widget = require("ui.panels.top-panel.date")
local clock_widget = require("ui.panels.top-panel.clock")

return function(s)
    local is_primary = s == screen.primary

    -- Create the wibox
    s.top_panel = awful.wibar({
        position = "top",
        screen = s,
        height = dpi(36),
        bg = beautiful.top_panel_bg
    })

    -- Create the wibox
    s.top_panel:setup{
        widget = wibox.container.margin,
        margins = beautiful.top_panel_outer_margin,
        {
            layout = wibox.layout.align.horizontal,
            expand = "none",
            {
                layout = wibox.layout.fixed.horizontal,
                id = "#left",
                spacing = dpi(5)
            },
            {
                layout = wibox.layout.fixed.horizontal,
                id = "#middle",
                spacing = dpi(5)

            },
            {
                layout = wibox.layout.fixed.horizontal,
                id = "#right",
                spacing = dpi(5)
            }
        }
    }

    local left = s.top_panel:get_children_by_id("#left")[1]
    left:add(taglist_widget(s))

    local middle = s.top_panel:get_children_by_id("#middle")[1]
    middle:add(clock_widget(s))

    local right = s.top_panel:get_children_by_id("#right")[1]

    right:add(ethernet_widget)
    right:add(wifi_widget)
    right:add(cpu_widget)
    right:add(memory_widget)
    right:add(battery_widget)
    --right:add(date_widget(s))

    if is_primary then right:add(systray_widget) end

    right:add(layoutbox_widget(s))

end

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
--local ip_widget = require("ui.panels.top-panel.ip")
local memory_widget = require("ui.panels.top-panel.memory")
local cpu_widget = require("ui.panels.top-panel.cpu")

local battery_widget = require("modules.awesome-wm-widgets.battery-widget.battery")
local volume_widget = require("modules.awesome-wm-widgets.volume-widget.volume")
local brightness_widget = require("modules.awesome-wm-widgets.brightness-widget.brightness")
local fs_widget = require("modules.awesome-wm-widgets.fs-widget.fs-widget")
local net_speed_widget = require("modules.awesome-wm-widgets.net-speed-widget.net-speed")
local ram_widget = require("modules.awesome-wm-widgets.ram-widget.ram-widget")

--- Seperators
local seperator = wibox.widget.textbox(" | ")
local seperator2 = wibox.widget.textbox(" ")

return function(s)
    local is_primary = s == screen.primary

    s.date = wibox.widget {
        --- {
            --- widget = wibox.widget.textbox,
            --- font = beautiful.icon_font,
            --- text = "󰥔"
        --- },
        {
            widget = wibox.widget.textclock("%Y-%m-%d"),
            font = beautiful.font,
        },
        spacing = dpi(4),
        widget = wibox.layout.fixed.horizontal
    }

    s.time = wibox.widget {
        --- {
            --- widget = wibox.widget.textbox,
            --- font = beautiful.icon_font,
            --- text = "󰥔"
        --- },
        {
            widget = wibox.widget.textclock("%H:%M:%S", 1),
            font = beautiful.font,
        },
         spacing = dpi(4),
         widget = wibox.layout.fixed.horizontal
     }

     s.month_calendar = awful.widget.calendar_popup.month {
        screen = s,
        week_numbers = true
    }
    s.month_calendar:attach(s.date, "tc")

    -- Create the wibox
    s.top_panel = awful.wibar {
        screen = s,
        position = "top",
        height = dpi(24),
        widget = {
            layout = wibox.layout.align.horizontal,
            expand = "none",
            {
                id = "#left",
                layout = wibox.layout.fixed.horizontal
            },
            {
                id = "#middle",
                layout = wibox.layout.fixed.horizontal,
            },
            {
                id = "#right",
                layout = wibox.layout.fixed.horizontal,
            }
        }
    }

    local left = s.top_panel:get_children_by_id("#left")[1]
    left:add(taglist_widget(s))

    local middle = s.top_panel:get_children_by_id("#middle")[1]
    middle:add(s.date)

    local right = s.top_panel:get_children_by_id("#right")[1]

    --right:add(net_speed_widget())
    -- Filesystem
    -- right:add(seperator)
    -- right:add(fs_widget {mounts = {"/"}})
    -- right:add(seperator)
    -- right:add(fs_widget {mounts = {"/home"}})
    -- Brightness
    --right:add(seperator)
    --right:add(brightness_widget {
        --type = "icon_and_text",
        --program = "brightnessctl",
        --step = 5
    --})
    ---- Volume
    --right:add(seperator)
    --right:add(volume_widget())
    -- CPU
    right:add(seperator)
    right:add(cpu_widget)
    ---- Memory
    right:add(seperator)
    right:add(memory_widget)
    ---- Network
    --right:add(seperator)
    --right:add(ip_widget)
    ---- Battery
    --right:add(seperator)
    --right:add(battery_widget {
        --show_current_level = true,
        --display_notification = false
    --})
    -- Time
    right:add(seperator)
    right:add(s.time)

    if is_primary then
        right:add(seperator)
        right:add(wibox.container.margin(wibox.widget.systray(), dpi(0), dpi(0), dpi(4), dpi(4)))
    end

    right:add(seperator)
    right:add(wibox.container.margin(layoutbox_widget(s), dpi(0), dpi(0), dpi(4), dpi(4)))

end

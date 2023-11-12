local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local config = require("config")
local theme = config.places.theme .. "/2023.lua"

local taglist_widget = require("ui.topbar.taglist")
local layoutbox_widget = require("ui.topbar.layoutbox")

local battery_widget = require("awesome-wm-widgets.battery-widget.battery")

screen.connect_signal("request::desktop_decoration", function(s)
    local is_primary = s == screen.primary

    -- Each screen has its own tag table.
    local l = awful.layout.suit -- Just to save some typing: use an alias.
    local layouts = {
        l.floating, l.fair, l.fair, l.tile, l.tile, l.max, l.tile, l.fair,
        l.tile, l.fair
    }
    awful.tag(config.tags, s, layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    s.mytextclock = wibox.widget.textclock("%H:%M:%S", 1)
    s.month_calendar = awful.widget.calendar_popup.month()
    s.month_calendar:attach(s.mytextclock, "tc")

    -- Create the wibox
    local wibar = awful.wibar {
        position = "top",
        screen = s,
        widget = {
            layout = wibox.layout.align.horizontal,
            expand = "none",
            {id = "#left", layout = wibox.layout.fixed.horizontal},
            {
                layout = wibox.container.margin,
                {
                    id = "#middle",
                    layout = wibox.layout.fixed.horizontal,
                    spacing = dpi(12)
                }
            },
            {
                id = "#right",
                layout = wibox.layout.fixed.horizontal,
                reverse = true
            }
        }
    }

    screen.topbar = {wibox = wibar}

    local left = wibar:get_children_by_id("#left")[1]
    left:add(taglist_widget(s))
    left:add(s.mypromptbox)

    local middle = wibar:get_children_by_id("#middle")[1]
    middle:add(s.mytextclock)

    local right = wibar:get_children_by_id("#right")[1]
    right:add(battery_widget())

    if is_primary then
        right:add(wibox.widget.textbox("|"))
        right:add(wibox.layout.margin(wibox.widget.systray(), 3, 3, 3, 3))
    end

    right:add(wibox.widget.textbox("|"))
    right:add(wibox.container.margin(layoutbox_widget(s), 3, 3, 3, 3))
end)

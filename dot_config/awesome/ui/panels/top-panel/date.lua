local awful = require("awful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

return function(s)
    s.month_calendar = awful.widget.calendar_popup.month {
        screen = s,
        week_numbers = true
    }

    mytextdate = wibox.widget.textclock("󰃭 %Y-%m-%d")
    s.month_calendar:attach(mytextdate, "tr")

    -- Clock widget
    container_date_widget = {
        {
            {widget = mytextdate},
            top = beautiful.top_panel_inner_margin_top,
            bottom = beautiful.top_panel_inner_margin_bottom,
            right = beautiful.top_panel_inner_margin_right,
            left = beautiful.top_panel_inner_margin_left,

            widget = wibox.container.margin
        },
        fg = beautiful.catppuccin_peach,
        bg = beautiful.catppuccin_surface0,
        widget = wibox.container.background
    }

    return container_date_widget
end

local awful = require("awful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

container_systray_widget = {
    {
        wibox.widget.systray(),
        top = beautiful.top_panel_inner_margin_top,
        bottom = beautiful.top_panel_inner_margin_bottom,
        right = beautiful.top_panel_inner_margin_right,
        left = beautiful.top_panel_inner_margin_left,
        widget = wibox.container.margin
    },
    fg = beautiful.catppuccin_surface0,
    bg = beautiful.catppuccin_surface0,
    shape = gears.shape.rounded_bar,
    widget = wibox.container.background
}

return container_systray_widget

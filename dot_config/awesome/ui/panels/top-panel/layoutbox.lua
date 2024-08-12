local awful = require("awful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

return function(s)
    container_layout_widget = {
       --- {
            awful.widget.layoutbox(s),
            top = beautiful.top_panel_inner_margin_top / 1.5,
            bottom = beautiful.top_panel_inner_margin_bottom / 1.5,
            right = beautiful.top_panel_inner_margin_right / 1.5,
            left = beautiful.top_panel_inner_margin_left / 1.5,
            widget = wibox.container.margin
       --- },
       --- fg = beautiful.catppuccin_surface0,
       --- bg = beautiful.catppuccin_surface0,
       --- widget = wibox.container.background
    }

    return container_layout_widget
end

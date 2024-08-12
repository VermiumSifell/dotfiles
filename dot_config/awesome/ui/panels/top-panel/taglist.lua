local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

return function(s)
    local container_taglist_widget = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        layout = {spacing = dpi(1), layout = wibox.layout.fixed.horizontal},
	style = {
		shape = gears.shape.circle,
	},
        widget_template = {
            {
                {
                    {id = 'text_role', widget = wibox.widget.textbox},
                    layout = wibox.layout.fixed.horizontal
                },
                top = beautiful.top_panel_inner_margin_top,
                bottom = beautiful.top_panel_inner_margin_bottom,
                right = beautiful.top_panel_inner_margin_right,
                left = beautiful.top_panel_inner_margin_left,

                widget = wibox.container.margin
            },
            id = 'background_role',
            widget = wibox.container.background
        },
        buttons = {
            awful.button({}, 1, function(t) t:view_only() end),

            awful.button({modkey}, 1, function(t)
                if client.focus then client.focus:move_to_tag(t) end
            end), awful.button({}, 3, awful.tag.viewtoggle),

            awful.button({modkey}, 3, function(t)
                if client.focus then client.focus:toggle_tag(t) end
            end),

            awful.button({}, 4, function(t)
                awful.tag.viewprev(t.screen)
            end),

            awful.button({}, 5, function(t)
                awful.tag.viewnext(t.screen)
            end)
        }
    }

    return container_taglist_widget
end

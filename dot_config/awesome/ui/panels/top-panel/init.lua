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

return function(s)
    local is_primary = s == screen.primary

    s.month_calendar = awful.widget.calendar_popup.month {
        screen = s,
        week_numbers = true
    }

    mytextclock = wibox.widget.textclock("%Y-%m-%d | %H:%M:%S", 1)
    s.month_calendar:attach(mytextclock, "tc")

    -- Clock widget
    container_clock_widget = {
        {
            {
                {
                    {widget = mytextclock},
                    left = dpi(4),
                    right = dpi(4),
                    top = dpi(4),
                    bottom = dpi(4),
                    widget = wibox.container.margin
                },
                fg = beautiful.catppuccin_text,
                bg = beautiful.catppuccin_surface0,
                widget = wibox.container.background
            },
            top = dpi(5),
            bottom = dpi(5),
            widget = wibox.container.margin
        },
        spacing = dpi(5),
        layout = wibox.layout.fixed.horizontal
    }

    s.mylayoutbox = awful.widget.layoutbox(s)

    container_layout_widget = {
        {
            {
                s.mylayoutbox,
                left = dpi(4),
                right = dpi(4),
                top = dpi(4),
                bottom = dpi(4),
                widget = wibox.container.margin
            },
            fg = beautiful.catppuccin_surface0,
            bg = beautiful.catppuccin_surface0,
            widget = wibox.container.background
        },
        top = dpi(5),
        bottom = dpi(5),
        right = dpi(5),
        widget = wibox.container.margin
    }

    container_systray_widget = {
        {
            {
                wibox.widget.systray(),
                left = dpi(4),
                right = dpi(4),
                top = dpi(4),
                bottom = dpi(4),
                widget = wibox.container.margin
            },
            fg = beautiful.catppuccin_surface0,
            bg = beautiful.catppuccin_surface0,
            widget = wibox.container.background
        },
        top = dpi(5),
        bottom = dpi(5),
        widget = wibox.container.margin
    }

    -- Create the wibox
    s.top_panel = awful.wibar({position = "top", screen = s, height = dpi(36)})

    -- Create the wibox
    s.top_panel:setup{
        layout = wibox.layout.align.horizontal,
        expand = "none",
        {layout = wibox.layout.fixed.horizontal, id = "#left"},
        {layout = wibox.layout.fixed.horizontal, id = "#middle"},
        {
            layout = wibox.layout.fixed.horizontal,
            id = "#right",
            spacing = dpi(5)
        }
    }

    local left = s.top_panel:get_children_by_id("#left")[1]
    left:add(taglist_widget(s))

    local middle = s.top_panel:get_children_by_id("#middle")[1]
    middle:add(container_clock_widget)

    local right = s.top_panel:get_children_by_id("#right")[1]

    right:add(wifi_widget)
    right:add(cpu_widget)
    right:add(memory_widget)

    if is_primary then right:add(container_systray_widget) end

    right:add(container_layout_widget)

end

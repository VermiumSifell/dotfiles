local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

local command = 'free -m | awk \'/Mem/{printf "%.f%%", $3/$2 * 100}\''

local function create_memory_widget()
    local memory_textbox = wibox.widget {widget = wibox.widget.textbox}

    local function update_memory_name(memory)
        memory_textbox.text = " " .. memory
    end

    gears.timer {
        timeout = 5,
        call_now = true,
        autostart = true,
        callback = function()
            awful.spawn.easy_async_with_shell(command, update_memory_name)
        end
    }

    local container_memory_widget = {
        {
            {widget = memory_textbox},
            top = beautiful.top_panel_inner_margin_top,
            bottom = beautiful.top_panel_inner_margin_bottom,
            right = beautiful.top_panel_inner_margin_right,
            left = beautiful.top_panel_inner_margin_left,
            widget = wibox.container.margin
        },
        fg = beautiful.catppuccin_pink,
        bg = beautiful.catppuccin_surface0,
        widget = wibox.container.background
    }

    return container_memory_widget
end

return create_memory_widget()

local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

local command = 'acpi -i'

local text_battery_name = wibox.widget {widget = wibox.widget.textbox}

local update_battery_name = function(stdout)
    local battery_info = {}
    local capacities = {}

    for s in stdout:gmatch("[^\r\n]+") do
        local status, charge_str = s:match('.+: ([%a%s]+), (%d?%d?%d)%%')
        if status then
            table.insert(battery_info,
                         {status = status, charge = tonumber(charge_str)})
            table.insert(capacities, 0)
        end

        local cap_str = s:match('.+last full capacity (%d+)')
        if cap_str then capacities[#capacities] = tonumber(cap_str) or 0 end
    end

    local total_capacity, total_charge, status = 0, 0

    for i, batt in ipairs(battery_info) do
        if capacities[i] then
            if batt.charge >= total_charge then status = batt.status end
            total_charge = total_charge + batt.charge * capacities[i]
            total_capacity = total_capacity + capacities[i]
        end
    end

    local charge = total_capacity > 0 and total_charge / total_capacity or 0

    local function get_battery_icon(charge, charging)
        local charging_icons = {
            "󰢜", "󰂆", "󰂇", "󰂈", "󰢝", "󰂉", "󰢞", "󰂊",
            "󰂋", "󰂅"
        }

        local discharging_icons = {
            "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁",
            "󰂂", "󰁹"
        }

        local charge_index = math.floor(charge / 10)
        if charge_index < 1 then charge_index = 1 end
        if charge_index > 10 then charge_index = 10 end

        local batteryType

        if status == "Charging" then
            batteryType = charging_icons[charge_index]
        else
            batteryType = discharging_icons[charge_index]

            if charge < 10 and enable_battery_warning and
                os.difftime(os.time(), last_battery_check) > 300 then
                last_battery_check = os.time()
                show_battery_warning()
            end
        end

        return batteryType
    end

    text_battery_name.text = get_battery_icon(charge, status) .. " " ..
                                 string.format('%d%%', charge)
end

gears.timer {
    timeout = 10,
    call_now = true,
    autostart = true,
    callback = function()
        awful.spawn.easy_async_with_shell(command, update_battery_name)
    end
}

container_battery_widget = {
    {
        {widget = text_battery_name},
        top = beautiful.top_panel_inner_margin_top,
        bottom = beautiful.top_panel_inner_margin_bottom,
        right = beautiful.top_panel_inner_margin_right,
        left = beautiful.top_panel_inner_margin_left,
        widget = wibox.container.margin
    },
    fg = beautiful.catppuccin_text,-- Would be cool to set colors, for example maroon based on percentage
    bg = beautiful.catppuccin_surface0,
    widget = wibox.container.background
}

return container_battery_widget

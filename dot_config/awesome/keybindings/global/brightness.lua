local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

modkey = "Mod4"

awful.keyboard.append_global_keybindings(
    {
        awful.key(
            {},
            "XF86MonBrightnessUp",
            function()
                awful.spawn("brightnessctl set 5+", false)
            end,
            {description = "increase screen brightness", group = "brightness"}
        ),
        awful.key(
            {},
            "XF86MonBrightnessDown",
            function()
                awful.spawn("brightnessctl set 5-", false)
            end,
            {description = "decrease screen brightness", group = "brightness"}
        )
    }
)

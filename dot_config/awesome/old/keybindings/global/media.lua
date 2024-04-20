local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local naughty = require("naughty")

modkey = "Mod4"

awful.keyboard.append_global_keybindings(
    {
        --awful.key(
            --{},
            --"XF86AudioPlay",
            --function()
                --awful.spawn("playerctl --player=spotify,%any play-pause", false)
            --end,
            --{description = "Play or Pause media", group = "media"}
        --),
        --awful.key(
            --{},
            --"XF86AudioPrev",
            --function()
                --awful.spawn("playerctl --player=spotify,%any previous", false)
            --end,
            --{description = "Previous media", group = "media"}
        --),
        --awful.key(
            --{},
            --"XF86AudioNext",
            --function()
                --awful.spawn("playerctl --player=spotify,%any next", false)
            --end,
            --{description = "Next media", group = "media"}
        --),
        --awful.key(
            --{},
            --"XF86AudioRaiseVolume",
            --function()
                --awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +10%", false)
                --awful.spawn("bash -c $HOME/.config/awesome/keybindings/global/media.sh", false)
            --end,
            --{description = "Increase Volume", group = "media"}
        --),
        --awful.key(
            --{},
            --"XF86AudioLowerVolume",
            --function()
                --awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10%", false)
                --awful.spawn("bash -c $HOME/.config/awesome/keybindings/global/media.sh", false)
            --end,
            --{description = "Decrease Volume", group = "media"}
        --),
        awful.key(
            {"Shift"},
            "XF86AudioRaiseVolume",
            function()
                awful.spawn("playerctl volume 0.1+", false)
                awful.spawn("bash -c $HOME/.config/awesome/keybindings/global/media-playerctl.sh", false)
            end,
            {description = "Increase Volume via playerctl", group = "media"}
        ),
        awful.key(
            {"Shift"},
            "XF86AudioLowerVolume",
            function()
                awful.spawn("playerctl volume 0.1-", false)
                awful.spawn("bash -c $HOME/.config/awesome/keybindings/global/media-playerctl.sh", false)
            end,
            {description = "Decrease Volume via playerctl", group = "media"}
        ),
        --awful.key(
            --{},
            --"XF86AudioMute",
            --function()
                --awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle", false)
            --end,
            --{description = "Mute Audio", group = "media"}
        --),
        awful.key(
            {},
            "XF86AudioMicMute",
            function()
                awful.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle", false)
            end,
            {description = "Mute Microphone", group = "media"}
        )
    }
)

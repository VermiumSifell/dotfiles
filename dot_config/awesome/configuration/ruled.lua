local awful = require("awful")
local beautiful = require("beautiful")
local ruled = require("ruled")
local helpers = require("helpers")

local tags = require("configuration.tags")

--- Get screen geometry
local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

ruled.client.connect_signal("request::rules", function()
    --- Global
    ruled.client.append_rule {
        id = "global",
        rule = {},
        properties = {
            focus = awful.client.focus.filter,
            raise = true,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap +
                awful.placement.no_offscreen
        }
    }

    -- Add titlebars to dialogs
    ruled.client.append_rule {
        id = "titlebars",
        rule_any = {type = {"dialog"}},
        properties = {titlebars_enabled = true}
    }

    -- Tag 1

    -- Tag 2
    ruled.client.append_rule {
        rule_any = {class = {"Emacs", "VSCodium"}},
        properties = {tag = tags.names[2], switch_to_tags = true}
    }

    -- Tag 3
    ruled.client.append_rule {
        rule_any = {class = {"Alacritty"}},
        properties = {tag = tags.names[3], switch_to_tags = true}
    }

    -- Tag 4
    ruled.client.append_rule {
        rule_any = {class = {"thunderbird"}},
        properties = {tag = tags.names[4], switch_to_tags = true}
    }

    -- Tag 5

    -- Tag 6
    ruled.client.append_rule {
        rule_any = {class = {"discord", "Signal"}},
        properties = {tag = tags.names[6], switch_to_tags = true}
    }

    -- Tag 7
    ruled.client.append_rule {
        rule_any = {class = {"Spotify"}},
        properties = {tag = tags.names[7], switch_to_tags = true}
    }

    -- Tag 8

    -- Tag 9
    ruled.client.append_rule {
        rule_any = {class = {"yuzu", "PrismLauncher"}},
        properties = {tag = tags.names[9], switch_to_tags = true}
    }

    -- Tag 10
    ruled.client.append_rule {
        rule_any = {class = {"firefox", "qutebrowser"}},
        properties = {tag = tags.names[10], switch_to_tags = true}
    }

end)

local config = require("config")
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
local lain = require("lain")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Load theme
local theme = config.places.theme .. "/2023.lua"
beautiful.init(theme)

-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
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
        properties = {tag = config.tags[2], switch_to_tags = true}
    }

    -- Tag 3
    ruled.client.append_rule {
        rule_any = {class = {"Alacritty"}},
        properties = {tag = config.tags[3], switch_to_tags = true}
    }

    -- Tag 4
    ruled.client.append_rule {
        rule_any = {class = {"thunderbird"}},
        properties = {tag = config.tags[4], switch_to_tags = true}
    }

    -- Tag 5

    -- Tag 6
    ruled.client.append_rule {
        rule_any = {class = {"discord", "Signal"}},
        properties = {tag = config.tags[6], switch_to_tags = true}
    }

    -- Tag 7
    ruled.client.append_rule {
        rule_any = {class = {"Spotify"}},
        properties = {tag = config.tags[7], switch_to_tags = true}
    }

    -- Tag 8

    -- Tag 9
    ruled.client.append_rule {
        rule_any = {class = {"yuzu", "PrismLauncher"}},
        properties = {tag = config.tags[9], switch_to_tags = true}
    }

    -- Tag 10
    ruled.client.append_rule {
        rule_any = {class = {"firefox", "qutebrowser"}},
        properties = {tag = config.tags[10], switch_to_tags = true}
    }

end)

-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.floating, awful.layout.suit.tile,
        awful.layout.suit.tile.left, awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top, awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal, awful.layout.suit.spiral,
        awful.layout.suit.spiral.dwindle, awful.layout.suit.max,
        awful.layout.suit.max.fullscreen, awful.layout.suit.magnifier,
        awful.layout.suit.corner.nw
    })
end)

-- Set wallpaper image
screen.connect_signal("request::wallpaper", function(s)
    awful.wallpaper {
        screen = s,
        widget = {
            {
                image = beautiful.wallpaper,
                upscale = true,
                downscale = true,
                widget = wibox.widget.imagebox
            },
            valign = "center",
            halign = "center",
            tiled = false,
            widget = wibox.container.tile
        }
    }
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = {
        awful.button({}, 1, function()
            c:activate{context = "titlebar", action = "mouse_move"}
        end), awful.button({}, 3, function()
            c:activate{context = "titlebar", action = "mouse_resize"}
        end)
    }

    awful.titlebar(c).widget = {
        {
            -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout = wibox.layout.fixed.horizontal
        },
        {
            -- Middle
            {
                -- Title
                halign = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout = wibox.layout.flex.horizontal
        },
        {
            -- Right
            awful.titlebar.widget.floatingbutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton(c),
            awful.titlebar.widget.ontopbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)
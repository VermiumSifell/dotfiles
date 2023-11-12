local config = require("config")
require("keybindings")


-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

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


-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal(
    "request::display_error",
    function(message, startup)
        naughty.notification {
            urgency = "critical",
            title = "Oops, an error happened" .. (startup and " during startup!" or "!"),
            message = message
        }
    end
)

-- Load theme
local theme = config.places.theme .. "/2023.lua"
beautiful.init(theme)

myawesomemenu = {
    {
        "hotkeys",
        function()
            hotkeys_popup.show_help(nil, awful.screen.focused())
        end
    },
    {"manual", config.apps.terminal .. " -e man awesome"},
    {"edit config", config.apps.editor .. " " .. awesome.conffile},
    {"restart", awesome.restart},
    {"quit", function()
            awesome.quit()
        end}
}

mymainmenu =
    awful.menu(
    {
        items = {
            {"awesome", myawesomemenu, beautiful.awesome_icon},
            {"open terminal", config.apps.terminal}
        }
    }
)

mylauncher =
    awful.widget.launcher(
    {
        image = beautiful.awesome_icon,
        menu = mymainmenu
    }
)

-- Run garbage collector regularly to prevent memory leaks
gears.timer {
       timeout = 30,
       autostart = true,
       callback = function() collectgarbage() end
}

client.connect_signal(
    "request::default_mousebindings",
    function()
        awful.mouse.append_client_mousebindings(
            {
                awful.button(
                    {},
                    1,
                    function(c)
                        c:activate {context = "mouse_click"}
                    end
                ),
                awful.button(
                    {"Mod4"},
                    1,
                    function(c)
                        c:activate {context = "mouse_click", action = "mouse_move"}
                    end
                ),
                awful.button(
                    {"Mod4"},
                    3,
                    function(c)
                        c:activate {context = "mouse_click", action = "mouse_resize"}
                    end
                )
            }
        )
    end
)

client.connect_signal(
    "request::default_keybindings",
    function()
        awful.keyboard.append_client_keybindings(
            {
                awful.key({"Mod4"}, "t", awful.titlebar.toggle, {description = "toggle title bar", group = "client"}),
                awful.key(
                    {"Mod4"},
                    "f",
                    function(c)
                        c.fullscreen = not c.fullscreen
                        c:raise()
                    end,
                    {description = "toggle fullscreen", group = "client"}
                ),
                awful.key(
                    {"Mod4", "Shift"},
                    "q",
                    function(c)
                        c:kill()
                    end,
                    {description = "close", group = "client"}
                ),
                awful.key(
                    {"Mod4", "Control"},
                    "space",
                    awful.client.floating.toggle,
                    {description = "toggle floating", group = "client"}
                ),
                awful.key(
                    {"Mod4", "Control"},
                    "Return",
                    function(c)
                        c:swap(awful.client.getmaster())
                    end,
                    {description = "move to master", group = "client"}
                ),
                awful.key(
                    {"Mod4"},
                    "o",
                    function(c)
                        c:move_to_screen()
                    end,
                    {description = "move to screen", group = "client"}
                ),
                awful.key(
                    {"Mod4"},
                    "t",
                    function(c)
                        c.ontop = not c.ontop
                    end,
                    {description = "toggle keep on top", group = "client"}
                ),
                awful.key(
                    {"Mod4"},
                    "n",
                    function(c)
                        -- The client currently has the input focus, so it cannot be
                        -- minimized, since minimized clients can't have the focus.
                        c.minimized = true
                    end,
                    {description = "minimize", group = "client"}
                ),
                awful.key(
                    {"Mod4"},
                    "m",
                    function(c)
                        c.maximized = not c.maximized
                        c:raise()
                    end,
                    {description = "(un)maximize", group = "client"}
                ),
                awful.key(
                    {"Mod4", "Control"},
                    "m",
                    function(c)
                        c.maximized_vertical = not c.maximized_vertical
                        c:raise()
                    end,
                    {description = "(un)maximize vertically", group = "client"}
                ),
                awful.key(
                    {"Mod4", "Shift"},
                    "m",
                    function(c)
                        c.maximized_horizontal = not c.maximized_horizontal
                        c:raise()
                    end,
                    {description = "(un)maximize horizontally", group = "client"}
                )
            }
        )
    end
)

-- End of Keybindings

-- {{{ Tag layout
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal(
    "request::default_layouts",
    function()
        awful.layout.append_default_layouts(
            {
                awful.layout.suit.floating,
                awful.layout.suit.tile,
                awful.layout.suit.tile.left,
                awful.layout.suit.tile.bottom,
                awful.layout.suit.tile.top,
                awful.layout.suit.fair,
                awful.layout.suit.fair.horizontal,
                awful.layout.suit.spiral,
                awful.layout.suit.spiral.dwindle,
                awful.layout.suit.max,
                awful.layout.suit.max.fullscreen,
                awful.layout.suit.magnifier,
                awful.layout.suit.corner.nw
            }
        )
    end
)
-- }}}

-- {{{ Wallpaper
screen.connect_signal(
    "request::wallpaper",
    function(s)
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
    end
)

require("ui")

-- {{{ Mouse bindings
awful.mouse.append_global_mousebindings(
    {
        awful.button(
            {},
            3,
            function()
                mymainmenu:toggle()
            end
        ),
        awful.button({}, 4, awful.tag.viewprev),
        awful.button({}, 5, awful.tag.viewnext)
    }
)
-- Rules to apply to new clients.
ruled.client.connect_signal(
    "request::rules",
    function()
        -- All clients will match this rule.
        ruled.client.append_rule {
            id = "global",
            rule = {},
            properties = {
                focus = awful.client.focus.filter,
                raise = true,
                screen = awful.screen.preferred,
                placement = awful.placement.no_overlap + awful.placement.no_offscreen
            }
        }

        -- Floating clients.
        ruled.client.append_rule {
            id = "floating",
            rule_any = {
                instance = {"copyq", "pinentry"},
                class = {
                    "Arandr",
                    "Blueman-manager",
                    "Gpick",
                    "Kruler",
                    "Sxiv",
                    "Tor Browser",
                    "Wpa_gui",
                    "veromix",
                    "xtightvncviewer"
                },
                -- Note that the name property shown in xprop might be set slightly after creation of the client
                -- and the name shown there might not match defined rules here.
                name = {
                    "Event Tester" -- xev.
                },
                role = {
                    "AlarmWindow", -- Thunderbird's calendar.
                    "ConfigManager", -- Thunderbird's about:config.
                    "pop-up" -- e.g. Google Chrome's (detached) Developer Tools.
                }
            },
            properties = {floating = true}
        }

        -- Add titlebars to normal clients and dialogs
        -- ruled.client.append_rule {
        --     id = "titlebars",
        --     rule_any = {type = {"normal", "dialog"}},
        --     properties = {titlebars_enabled = true}
        -- }

        ruled.client.append_rule {
            rule_any = {class = {"Emacs", "VSCodium"}},
            properties = {tag = config.tags[2], switch_to_tags = true}
        }

        ruled.client.append_rule {
            rule_any = {class = {"yuzu"}},
            properties = {tag = config.tags[9], switch_to_tags = true}
        }

        ruled.client.append_rule {
            rule_any = {class = {"Alacritty"}},
            properties = {tag = config.tags[3], switch_to_tags = true}
        }

        ruled.client.append_rule {
            rule_any = {class = {"Spotify"}},
            properties = {tag = config.tags[7], switch_to_tags = true}
        }

        -- Set Firefox to always map on the tag named "2" on screen 1.
        ruled.client.append_rule {
            rule_any = {class = {"firefox", "qutebrowser"}},
            properties = {tag = config.tags[10], switch_to_tags = true}
        }
    end
)
-- }}}

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal(
    "request::titlebars",
    function(c)
        -- buttons for the titlebar
        local buttons = {
            awful.button(
                {},
                1,
                function()
                    c:activate {context = "titlebar", action = "mouse_move"}
                end
            ),
            awful.button(
                {},
                3,
                function()
                    c:activate {context = "titlebar", action = "mouse_resize"}
                end
            )
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
    end
)

ruled.notification.connect_signal(
    "request::rules",
    function()
        -- All notifications will match this rule.
        ruled.notification.append_rule {
            rule = {},
            properties = {screen = awful.screen.preferred, implicit_timeout = 5}
        }
    end
)

naughty.connect_signal(
    "request::display",
    function(n)
        naughty.layout.box {notification = n}
    end
)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal(
    "mouse::enter",
    function(c)
        c:activate {context = "mouse_enter", raise = false}
    end
)

-- Startup
awful.spawn("autorandr -c")
awful.spawn("picom")

---@diagnostic disable: param-type-mismatch
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
---@diagnostic enable: param-type-mismatch

require("keybindings.global")
require("keybindings.client")

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

mylauncher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = mymainmenu
})

myawesomemenu = {
    {
        "hotkeys",
        function() hotkeys_popup.show_help(nil, awful.screen.focused()) end
    }, {"manual", config.apps.terminal .. " -e man awesome"},
    {"edit config", config.apps.editor .. " " .. awesome.conffile},
    {"restart", awesome.restart}, {"quit", function() awesome.quit() end}
}

mymainmenu = awful.menu({
    items = {
        {"awesome", myawesomemenu, beautiful.awesome_icon},
        {"open terminal", config.apps.terminal}
    }
})

-- Mouse bindings
awful.mouse.append_global_mousebindings({
    awful.button({}, 3, function() mymainmenu:toggle() end),
    awful.button({}, 4, awful.tag.viewprev),
    awful.button({}, 5, awful.tag.viewnext)
})

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({}, 1, function(c)
            c:activate{context = "mouse_click"}
        end), awful.button({"Mod4"}, 1, function(c)
            c:activate{context = "mouse_click", action = "mouse_move"}
        end), awful.button({"Mod4"}, 3, function(c)
            c:activate{context = "mouse_click", action = "mouse_resize"}
        end)
    })
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate{context = "mouse_enter", raise = false}
end)
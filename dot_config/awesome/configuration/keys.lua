local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
local beutiful = require("beautiful")
local naughty = require("naughty")
local apps = require("configuration.apps")

super = "Mod4"
alt = "Mod1"
ctrl = "Control"
shift = "Shift"

--- Global key bindings
awful.keyboard.append_global_keybindings({
    --- App
    --- Terminal
    awful.key({ super }, "Return", function()
        awful.spawn(apps.default.terminal)
        end, { description = "open terminal", group = "app" }),

    --- App launcher
    awful.key({ super }, "d", function()
        awful.spawn.with_shell(apps.default.app_launcher)
    end, { description = "open app launcher", group = "app" }),

    --- Code editor
    awful.key({ super, shift }, "e", function()
        awful.spawn(apps.default.code_editor)
    end, { description="open code editor", group= "app" }),

    --- File manager
    awful.key({ super, shift }, "f", function()
        awful.spawn(apps.default.file_manager)
    end, { description = "open file manager", group = "app" }),

    --- Web browser
    awful.key({ super, shift }, "w", function()
        awful.spawn(apps.default.web_browser)
    end, { description = "open web browser", group = "app" }),

    --- WM
    --- Restart awesome
    awful.key({ super, ctrl }, "r", awesome.restart, { description = "reload awesome", group = "WM" }),

    --- Quit awesome
    awful.key({ super, ctrl }, "e", awesome.quit, { description = "quit awesome", group = "WM" }),

    --- Show help
    awful.key({ super }, "s", hotkeys_popup.show_help, { description = "show help", group = "WM" }),

    --- Client
    --- Focus client by direction
    awful.key({ super }, "Right", function()
        awful.client.focus.global_bydirection("right")
    end, { description = "focus right", group = "client" }),
    awful.key({ super }, "Left", function()
        awful.client.focus.global_bydirection("left")
    end, { description = "focus left", group = "client" }),
    awful.key({ super }, "Up", function()
        awful.client.focus.global_bydirection("up")
    end, { description = "focus up", group = "client" }),
    awful.key({ super }, "Down", function()
        awful.client.focus.global_bydirection("down")
    end, { description = "focus down", group = "client" }),

    --- Hotkeys
    --- Music player
    awful.key({ super }, "section", function()
        awful.spawn.with_shell(apps.default.music_player)
    end, { description = "open music client", group = "hotkeys" }),

    --- Brightness Control
    awful.key({}, "XF86MonBrightnessUp", function()
        awful.spawn("brightnessctl set 5%+ -q", false)
    end, { description = "increase brightness", group = "hotkeys" }),
    awful.key({}, "XF86MonBrightnessDown", function()
        awful.spawn("brightnessctl set 5%- -q", false)
    end, { description = "decrease brightness", group = "hotkeys" }),

    --- Volume control
    awful.key({}, "XF86AudioRaiseVolume", function()
        awful.spawn("amixer sset Master 5%+", false)
    end, { description = "increase volume", group = "hotkeys" }),
    awful.key({}, "XF86AudioLowerVolume", function()
        awful.spawn("amixer sset Master 5%-", false)
    end, { description = "decrease volume", group = "hotkeys" }),
    awful.key({}, "XF86AudioMute", function()
        awful.spawn("amixer sset Master toggle", false)
    end, { description = "mute volume", group = "hotkeys" }),

    --- Music
    awful.key({}, "XF86AudioPlay", function()
        awful.spawn("playerctl --player=spotify_player,spotify,%any play-pause", false)
    end, { description = "play pause music", group = "hotkeys" }),
    awful.key({}, "XF86AudioPrev", function()
        awful.spawn("playerctl --player=spotify_player,spotify,%any previous", false)
    end, { description = "previous music", group = "hotkeys" }),
    awful.key({}, "XF86AudioNext", function()
        awful.spawn("playerctl --player=spotify_player,spotify,%any next", false)
    end, { description = "next music", group = "hotkeys" }),

    --- Calculator Overlay
    awful.key({ super }, "q", function()
        awful.spawn("rofi -show calc -modi calc -no-show-match -no-sort", false)
    end, { description = "open calculator overlay", group = "hotkeys" }),

    --- Emoji picker
    awful.key({ super }, "x", function()
        awful.spawn("rofimoji", false)
    end, { description = "open emoji picker", group = "hotkeys" }),

    --- Lockscreen
    awful.key({ super, shift }, "s", function()
        awful.spawn("slock", false)
    end, { description = "lock screen", group = "hotkeys" })

})

--- Client key bindings
client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key({ super }, "t", awful.titlebar.toggle, { description = "toggle title bar", group = "client" }),
        awful.key({ super }, "f", function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end, { description = "toggle fullscreen", group = "client" }),
        awful.key({ super, shift } , "q", function(c)
            c:kill()
        end, { description = "close", group = "client" }),
        awful.key({ super, ctrl }, "space", awful.client.floating.toggle, { description = "toggle floating", group = "client" }),
        awful.key({ super, ctrl }, "Return", function(c)
            c:swap(awful.client.getmaster())
        end, { description = "move to master", group = "client" }),
        awful.key({ super }, "o", function(c)
            c:move_to_screen()
        end, { description = "move to screen", group = "client" }),
        awful.key({ super }, "t", function(c)
            c.ontop = not c.ontop
        end, { description = "toggle keep on top", group = "client" }),
        awful.key({ super }, "n", function(c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end, { description = "minimize", group = "client" }),
        awful.key({ super }, "m", function(c)
            c.maximized = not c.maximized
            c:raise()
        end, { description = "(un)maximize", group = "client" }),
        awful.key({ super, ctrl }, "m", function(c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end, { description = "(un)maximize vertically", group = "client" } ),
        awful.key({ super, shift }, "m", function(c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end, { description = "(un)maximize horizontally", group = "client" })
    })
end)

--- Resize focused client
awful.keygrabber {
    stop_key = gears.table.join({"Escape"}, {super, "r"}),
    timeout = 3,
    root_keybindings = {
      {
        { super }, "r", function()
        end
      }
    },
    keybindings = {
        {
            {}, "Left", function()
                awful.tag.incmwfact(-0.02)
            end
        },
        {
            {}, "Down", function()
                awful.client.incwfact(0.03)
            end
        },
        {
            {}, "Up", function()
                awful.client.incwfact(-0.03)
            end
        },
        {
            {}, "Right", function()
                awful.tag.incmwfact(0.02)
            end
        }
    }
}

--- Layout
awful.keyboard.append_global_keybindings({
    awful.key({ super, shift }, "Right", function()
        awful.client.swap.byidx(1)
    end, { description = "swap with next client by index", group = "client" }),
    awful.key({ super, shift }, "Left", function()
        awful.client.swap.byidx(-1)end, { description = "swap with previous client by index", group = "client" }),
    awful.key({ super }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
    awful.key({ super, "Mod1" }, "Right", function()
        awful.tag.incmwfact(0.05)
    end, { description = "increase master width factor", group = "layout" }),
    awful.key({ super, "Mod1" }, "Left", function()
        awful.tag.incmwfact(-0.05)end, { description = "decrease master width factor", group = "layout" }),
    awful.key({ super, shift }, "h", function()
        awful.tag.incnmaster(1, nil, true)
    end, { description = "increase the number of master clients", group = "layout" }),
    awful.key({ super, shift }, "l", function()
        awful.tag.incnmaster(-1, nil, true)
    end, { description = "decrease the number of master clients", group = "layout" }),
    awful.key({ super, "Control" }, "h", function()
        awful.tag.incncol(1, nil, true)end, { description = "increase the number of columns", group = "layout" }),
    awful.key({ super, "Control" }, "l", function()
        awful.tag.incncol(-1, nil, true)
    end, { description = "decrease the number of columns", group = "layout" }),
    awful.key({ super }, "space", function()
        awful.layout.inc(1)
    end, { description = "select next", group = "layout"}),
    awful.key({ super, shift }, "space", function()
        awful.layout.inc(-1)
    end, { description = "select previous", group = "layout" })
})

--- Move through workspaces
awful.keyboard.append_global_keybindings({
    awful.key {
      modifiers = { super },
      keygroup = "numrow",
      description = "only view tag",
      group = "tag",
      on_press = function(index)
        local screen = awful.screen.focused()
        local tag = screen.tags[index]
        if index == 0 then
          tag = screen.tags[10]
        end
        if tag then
          tag:view_only()
        end
      end
    },
    awful.key {
      modifiers = { super, ctrl},
      keygroup = "numrow",
      description = "toggle tag",
      group = "tag",
      on_press = function(index)
        local screen = awful.screen.focused()
        local tag = screen.tags[index]
        if index == 0 then
          tag = screen.tags[10]
        end
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end
    },
    awful.key {
      modifiers = {super, shift},
      keygroup = "numrow",
      description = "move focused client to tag",
      group = "tag",
      on_press = function(index)
        if client.focus then
          local tag = client.focus.screen.tags[index]

          if index == 0 then
            tag = client.focus.screen.tags[10]
          end

          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end
    },
    awful.key {
      modifiers = {super, ctrl, shift},
      keygroup = "numrow",
      description = "toggle focused client on tag",
      group = "tag",
      on_press = function(index)
        if client.focus then
          local tag = client.focus.screen.tags[index]

          if index == 0 then
            tag = client.focus.screen.tags[10]
          end

          if tag then
            client.focus:toggle_tag(tag)
          end
        end
      end

    },
    awful.key {
      modifiers = {super},
      keygroup = "numpad",
      description = "select layout directly",
      group = "layout",
      on_press = function(index)
        local t = awful.screen.focused().selected_tag
        if t then
          t.layout = t.layouts[index] or t.layout
        end
      end
    }
})

--- Screen
awful.keyboard.append_global_keybindings({
    -- No need for these (single screen setup)
    awful.key({ super }, "p", function () awful.screen.focus_relative( 1) end, {description = "focus the next screen", group = "screen"}),
    awful.key({ super, shift }, "p", function () awful.screen.focus_relative(-1) end, {description = "focus the previous screen", group = "screen"}),
})

--- Mouse bindings on desktop
awful.mouse.append_global_mousebindings({
    awful.button({}, 3, function() mymainmenu:toggle() end),
    awful.button({}, 4, awful.tag.viewprev),
    awful.button({}, 5, awful.tag.viewnext)
})

--- Mouse buttons on the client
client.connect_signal("request::default_mousebindings", function()
	awful.mouse.append_client_mousebindings({
		awful.button({}, 1, function(c)
			c:activate({ context = "mouse_click" })
		end),
		awful.button({ super }, 1, function(c)
			c:activate({ context = "mouse_click", action = "mouse_move" })
		end),
		awful.button({ super }, 3, function(c)
			c:activate({ context = "mouse_click", action = "mouse_resize" })
		end),
	})
end)

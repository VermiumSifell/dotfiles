local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local config = require("config")

awful.keyboard.append_global_keybindings(
    {
        awful.key(
            {"Mod4"},
            "Return",
            function()
                awful.spawn(config.apps.terminal)
            end,
            {description = "open a terminal", group = "launcher"}
        )
        -- awful.key(
        --     {modkey},
        --     "r",
        --     function()
        --         awful.screen.focused().mypromptbox:run()
        --     end,
        --     {description = "run prompt", group = "launcher"}
        -- )
        -- awful.key(
        --     {modkey},
        --     "p",
        --     function()
        --         menubar.show()
        --     end,
        --     {description = "show the menubar", group = "launcher"}
        -- )
    }
)

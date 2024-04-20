local awful = require("awful")

return function(s)
    local widget = awful.widget.layoutbox {
        screen = s,
        buttons = {
            awful.button({}, 1, function()
                    awful.layout.inc(1)
            end),
            awful.button({}, 3, function()
                    awful.layout.inc(-1)
            end),
            awful.button({}, 4, function()
                    awful.layout.inc(-1)
            end),
            awful.button({}, 5, function()
                    awful.layout.inc(1)
            end)
        }
    }

    return widget
end

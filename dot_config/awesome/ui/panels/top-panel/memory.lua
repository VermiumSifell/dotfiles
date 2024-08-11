local wibox = require("wibox")
local awful = require("awful")
local watch = require("awful.widget.watch")
local gears = require("gears")
local beautiful = require("beautiful")

-- local command = 'free -m | awk \'/Mem/{printf "%.1f/%.1fGB (%.2f%%)", $3/1024,$2/1024,$3*100/$2}\''
local command = 'free -m | awk \'/Mem/{printf "%.f%%", $3/1024,$2/1024,$3*100/$2}\''


---| CREATE CUSTOM WIFI WIDGET |---

-- create empty textbox widget -- 
local text_memory_name = wibox.widget{
    widget=wibox.widget.textbox
}

local update_memory_name = function (memory)
    text_memory_name.text = " " .. memory
end

-- fill the textbox widget with the output of the shell script --
gears.timer {
    timeout = 10,
    call_now = true,
    autostart = true,
    callback = function ()
        awful.spawn.easy_async_with_shell(command, function (stdout)
	
    local memory = stdout
    update_memory_name(memory)

end)

    end
}

-- create a container for the widget -- 
container_memory_widget = {
    {
        {
                {
                    widget=text_memory_name,
                },
                left = 10,
		right = 10,
		top = 6,
		bottom = 6,
		widget = wibox.container.margin,
		},
		fg = beautiful.catppuccin_pink,
		bg = beautiful.catppuccin_surface0,
		widget = wibox.container.background,
	},
        top = 5,
        bottom = 5,
        widget = wibox.container.margin,
}

return container_memory_widget

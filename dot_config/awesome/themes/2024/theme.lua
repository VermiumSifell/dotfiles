---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gears = require("gears")
local themes_path = gears.filesystem.get_configuration_dir() .. "themes/2024/"

local theme = {}

theme.font = "JetBrainsMono Nerd Font Propo 9"
theme.icon_font = "JetBrainsMono Nerd Font Propo 10"
theme.taglist_font = "JetBrainsMono Nerd Font Propo 12"

--"pango:JetbrainsMono Nerd Font 8"

theme.catppuccin_base = "#1e1e2e" --- Base 	#1e1e2e 	rgb(30, 30, 46) 	hsl(240, 21%, 15%)
theme.catppuccin_green = "#a6e3a1" --- Green 	#a6e3a1 	rgb(166, 227, 161) 	hsl(115, 54%, 76%)
theme.catppuccin_text = "#cdd6f4" --- Text 	#cdd6f4 	rgb(205, 214, 244) 	hsl(226, 64%, 88%)
theme.catppuccin_red = "#f38ba8" --- Red 	#f38ba8 	rgb(243, 139, 168) 	hsl(343, 81%, 75%)
theme.catppuccin_surface0 = "#313244" --- Surface0 	#313244 	rgb(49, 50, 68) 	hsl(237, 16%, 23%)
theme.catppuccin_peach = "#fab387" --- Peach 	#fab387 	rgb(250, 179, 135) 	hsl(23, 92%, 75%)
theme.catppuccin_mantle = "#181825" --- Mantle 	#181825 	rgb(24, 24, 37) 	hsl(240, 21%, 12%)
theme.catppuccin_pink = "#f5c2e7" --- Pink 	#f5c2e7 	rgb(245, 194, 231) 	hsl(316, 72%, 86%)

--- Rosewater 	#f5e0dc 	rgb(245, 224, 220) 	hsl(10, 56%, 91%)
--- Flamingo 	#f2cdcd 	rgb(242, 205, 205) 	hsl(0, 59%, 88%)
--- Mauve 	#cba6f7 	rgb(203, 166, 247) 	hsl(267, 84%, 81%)
--- Maroon 	#eba0ac 	rgb(235, 160, 172) 	hsl(350, 65%, 77%)
--- Yellow 	#f9e2af 	rgb(249, 226, 175) 	hsl(41, 86%, 83%)
--- Teal 	#94e2d5 	rgb(148, 226, 213) 	hsl(170, 57%, 73%)
--- Sky 	#89dceb 	rgb(137, 220, 235) 	hsl(189, 71%, 73%)
--- Sapphire 	#74c7ec 	rgb(116, 199, 236) 	hsl(199, 76%, 69%)
--- Blue 	#89b4fa 	rgb(137, 180, 250) 	hsl(217, 92%, 76%)
--- Lavender 	#b4befe 	rgb(180, 190, 254) 	hsl(232, 97%, 85%)
--- Subtext1 	#bac2de 	rgb(186, 194, 222) 	hsl(227, 35%, 80%)
--- Subtext0 	#a6adc8 	rgb(166, 173, 200) 	hsl(228, 24%, 72%)
--- Overlay2 	#9399b2 	rgb(147, 153, 178) 	hsl(228, 17%, 64%)
--- Overlay1 	#7f849c 	rgb(127, 132, 156) 	hsl(230, 13%, 55%)
--- Overlay0 	#6c7086 	rgb(108, 112, 134) 	hsl(231, 11%, 47%)
--- Surface2 	#585b70 	rgb(88, 91, 112) 	hsl(233, 12%, 39%)
--- Surface1 	#45475a 	rgb(69, 71, 90) 	hsl(234, 13%, 31%)
--- Crust 	#11111b 	rgb(17, 17, 27) 	hsl(240, 23%, 9%)


-- Background
theme.bg_normal = theme.catppuccin_base
theme.bg_focus = theme.catppuccin_green
theme.bg_urgent = theme.catppuccin_red
theme.bg_minimize = "#ffffff"
theme.bg_systray = theme.catppuccin_surface0

-- Foreground
theme.fg_normal = theme.catppuccin_text
theme.fg_focus = theme.catppuccin_base
theme.fg_urgent = theme.catppuccin_base
theme.fg_minimize = theme.catppuccin_text

-- Taglist
theme.taglist_bg_empty = theme.catppuccin_surface0
theme.taglist_bg_occupied = theme.catppuccin_peach
theme.taglist_bg_focus = theme.catppuccin_green
--- theme.taglist_bg_volatile = "#00000000"
--- theme.taglist_bg_urgent = "#00000000"

theme.taglist_fg_empty = theme.catppuccin_text
theme.taglist_fg_occupied = theme.catppuccin_base
theme.taglist_fg_focus = theme.catppuccin_base
theme.taglist_fg_volatile = theme.catppuccin_base
theme.taglist_fg_urgent = theme.catppuccin_base


theme.useless_gap = dpi(2)
theme.border_width = dpi(3)
theme.border_normal = theme.bg_normal
theme.border_focus = theme.catppuccin_green
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- theme.taglist_bg_focus = "#FFFFFF"

--theme.taglist_fg_occupied = "#fab387"

-- Generate taglist squares:
-- local taglist_square_size = dpi(4)
-- theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
-- theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path .. "titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path .. "titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path .. "titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path .. "titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path .. "titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themes_path .. "titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path .. "titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themes_path .. "titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path .. "titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themes_path .. "titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "titlebar/maximized_focus_active.png"

-- theme.wallpaper = themes_path.."background.png"
theme.wallpaper = themes_path .. "wall.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. "layouts/fairhw.png"
theme.layout_fairv = themes_path .. "layouts/fairvw.png"
theme.layout_floating = themes_path .. "layouts/floatingw.png"
theme.layout_magnifier = themes_path .. "layouts/magnifierw.png"
theme.layout_max = themes_path .. "layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "layouts/tilebottomw.png"
theme.layout_tileleft = themes_path .. "layouts/tileleftw.png"
theme.layout_tile = themes_path .. "layouts/tilew.png"
theme.layout_tiletop = themes_path .. "layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "Papirus-Dark"

theme.systray_icon_spacing = dpi(10)


theme.wibar = {
    bg = theme.bg_normal,
    spacing = dpi(12)
}

theme.wibar.item_height = dpi(30)
theme.wibar.height = dpi(24)

-- TODO: Rename `theme.wibar.build_placement`
function theme.wibar.build_placement(widget, wibar, args)
    return function(d)
        aplacement.next_to_widget(
            d,
            gtable.crush(
                {
                    geometry = hwidget.find_geometry(widget, wibar),
                    position = "bottom",
                    anchor = "middle",
                    outside = true,
                    screen = wibar.screen,
                    margins = theme.popup.margins
                },
                args or {}
            )
        )
    end
end

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80

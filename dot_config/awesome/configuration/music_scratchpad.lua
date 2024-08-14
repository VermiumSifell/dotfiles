local bling = require("modules.bling")

local music_scratchpad = bling.module.scratchpad {
    command = "alacritty --class music -e spotify_player", -- How to spawn the scratchpad
    rule = {class = "music"}, -- The rule that the scratchpad will be searched by
    sticky = false,                                    -- Whether the scratchpad should be sticky
    autoclose = false,                                 -- Whether it should hide itself when losing focus
    floating = true,                                  -- Whether it should be floating (MUST BE TRUE FOR ANIMATIONS)
    geometry = {x=360, y=90, height=900, width=1200}, -- The geometry in a floating state
    reapply = true,                                   -- Whether all those properties should be reapplied on every new opening of the scratchpad (MUST BE TRUE FOR ANIMATIONS)
    dont_focus_before_close  = false,                 --- When set to true, the scratchpad will be closed by the toggle function regardless of whether its focused or not.
    						      --- When set to false, the toggle function will first bring the scratchpad into focus and only close it on a second call
}

return music_scratchpad

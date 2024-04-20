-- DEPENDENCIES (see below)
local gfilesystem = require("gears.filesystem")

local config = {}

---@class Features
---@field screenshot_tools boolean?
---@field magnifier_tools boolean?
---@field torrent_widget boolean?
---@field weather_widget boolean?
---@field redshift_widget boolean?
---@field wallpaper_menu boolean?
config.features = {
    screenshot_tools = false,
    magnifier_tools = false,
    torrent_widget = false,
    weather_widget = false,
    redshift_widget = false,
    wallpaper_menu = false
}

config.places = {}
config.places.home = os.getenv("HOME")
config.places.config = os.getenv("XDG_CONFIG_HOME") or
                           (config.places.home .. "/.config")
config.places.awesome = string.match(gfilesystem.get_configuration_dir(),
                                     "^(/?.-)/*$")
config.places.theme = config.places.awesome .. "/theme"
config.places.screenshots = config.places.home .. "/inbox/screenshots"
config.places.wallpapers = config.places.home .. "/media/look/wallpapers"

config.wm = {name = "awesome"}

local terminal = "alacritty"
local terminal_execute = terminal .. " -e "

config.apps = {
    shell = "bash",
    terminal = terminal,
    editor = terminal_execute .. "vim",
    browser = "librewolf",
    private_browser = "librewolf --private-window",
    file_manager = terminal_execute .. "lf",
    calculator = "speedcrunch",
    mixer = terminal_execute .. "pulsemixer",
    bluetooth_control = terminal_execute .. "bluetoothctl"
}

config.tags = {
    "󱓞 1", "󰈮 2", " 3", "󰇮 4", "󰦑 5", "󰭻 6", "󰝚 7",
    "󱛉 8", "󰊴 9", "󰖟 10"
}

config.power = {
    shutdown = "systemctl poweroff",
    reboot = "systemctl reboot",
    suspend = "systemctl suspend",
    kill_session = "loginctl kill-session ''",
    lock_session = "loginctl lock-session",
    lock_screen = "light-locker-command --lock"
}

config.actions = {
    qr_code_clipboard = "qrclip",
    show_launcher = "rofi -show",
    show_calculator = "rofi -show calc -modi calc -no-show-match -no-sort",
    show_emoji_picker = "rofimoji"
}

config.commands = {}

function config.commands.open(path) return "xdg-open \"" .. path .. "\"" end

local awful_utils = require("awful.util")
awful_utils.shell = config.apps.shell

return config

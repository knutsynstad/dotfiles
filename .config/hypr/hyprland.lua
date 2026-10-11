-- Hyprland 0.55+ Lua configuration
require('lua.monitors')
require('lua.appearance')
require('lua.animations')
require('lua.rules')
require('lua.keybinds')

hl.env('XCURSOR_SIZE', '24')
hl.env('HYPRCURSOR_SIZE', '24')
hl.on('hyprland.start', function()
    hl.exec_cmd('waybar & hyprpaper')
end)

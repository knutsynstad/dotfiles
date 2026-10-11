local mod = 'SUPER'
local exec = hl.dsp.exec_cmd
hl.bind(mod .. ' + Return', exec('kitty'))
hl.bind(mod .. ' + B', exec('firefox'))
hl.bind(mod .. ' + Q', hl.dsp.window.close())
hl.bind(mod .. ' + M', hl.dsp.exit())
hl.bind(mod .. ' + E', exec('nautilus'))
hl.bind(mod .. ' + F', hl.dsp.window.fullscreen())
hl.bind(mod .. ' + Space', hl.dsp.window.float({ action = 'toggle' }))
hl.bind(mod .. ' + R', exec('rofi -show drun'))
hl.bind(mod .. ' + P', hl.dsp.window.pseudo())

local screenshot = 'mkdir -p ~/Pictures/screenshots; tee ~/Pictures/screenshots/screenshot_$(date +%Y-%m-%d_%H-%M-%S).png | wl-copy'
hl.bind('Print', exec('grim - | ' .. screenshot))
hl.bind('ALT + Print', exec('grim -g "$(slurp)" - | ' .. screenshot))

for _, dir in ipairs({'left', 'right', 'up', 'down'}) do
    hl.bind(mod .. ' + ' .. dir, hl.dsp.focus({ direction = dir }))
end
for i = 1, 10 do
    local key = tostring(i % 10)
    hl.bind(mod .. ' + ' .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. ' + SHIFT + ' .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mod .. ' + S', hl.dsp.workspace.toggle_special('magic'))
hl.bind(mod .. ' + SHIFT + S', hl.dsp.window.move({ workspace = 'special:magic' }))
hl.bind(mod .. ' + mouse_down', hl.dsp.focus({ workspace = 'e+1' }))
hl.bind(mod .. ' + mouse_up', hl.dsp.focus({ workspace = 'e-1' }))
hl.bind(mod .. ' + mouse:272', hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. ' + mouse:273', hl.dsp.window.resize(), { mouse = true })

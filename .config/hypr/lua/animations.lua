hl.config({ animations = { enabled = true } })
local curves = {
    easeOutQuint = {{0.23, 1}, {0.32, 1}},
    easeInOutCubic = {{0.65, 0.05}, {0.36, 1}},
    linear = {{0, 0}, {1, 1}},
    almostLinear = {{0.5, 0.5}, {0.75, 1}},
    quick = {{0.15, 0}, {0.1, 1}},
}
for name, points in pairs(curves) do
    hl.curve(name, { type = 'bezier', points = points })
end
local animations = {
    {'global', 10, 'default'},
    {'border', 5.39, 'easeOutQuint'},
    {'windows', 4.79, 'easeOutQuint'},
    {'windowsIn', 4.1, 'easeOutQuint', 'popin 87%'},
    {'windowsOut', 1.49, 'linear', 'popin 87%'},
    {'fadeIn', 1.73, 'almostLinear'},
    {'fadeOut', 1.46, 'almostLinear'},
    {'fade', 3.03, 'quick'},
    {'layers', 3.81, 'easeOutQuint'},
    {'layersIn', 2.5, 'easeOutQuint', 'slidefade bottom'},
    {'layersOut', 1.5, 'linear', 'fade'},
    {'fadeLayersIn', 1.79, 'almostLinear'},
    {'fadeLayersOut', 1.39, 'almostLinear'},
    {'workspaces', 1.94, 'almostLinear', 'fade'},
    {'workspacesIn', 1.21, 'almostLinear', 'fade'},
    {'workspacesOut', 1.94, 'almostLinear', 'fade'},
}
for _, a in ipairs(animations) do
    local config = { leaf = a[1], enabled = true, speed = a[2], bezier = a[3] }
    if a[4] then config.style = a[4] end
    hl.animation(config)
end

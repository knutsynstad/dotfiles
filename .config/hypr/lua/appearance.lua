hl.config({
    xwayland = { force_zero_scaling = true },
    general = {
        border_size = 2, gaps_in = 4, gaps_out = 8,
        col = { active_border = 'rgba(ffffffff)', inactive_border = 'rgba(00000000)' },
        resize_on_border = true, extend_border_grab_area = 16,
        hover_icon_on_border = true, allow_tearing = false, layout = 'dwindle',
        snap = { enabled = true },
    },
    decoration = {
        rounding = 16, rounding_power = 2, border_part_of_window = false,
        active_opacity = 1.0, inactive_opacity = 1.0,
        shadow = { enabled = true, color = 'rgba(00000080)', range = 16, render_power = 1 },
        blur = { enabled = false, size = 8, passes = 1, contrast = 0.3,
                 brightness = 0.7, vibrancy = 0.3 },
    },
    dwindle = { preserve_split = true },
    master = { new_status = 'master' },
    misc = { force_default_wallpaper = 0, disable_hyprland_logo = true },
    input = {
        kb_layout = 'us', kb_variant = '', kb_model = '', kb_options = '', kb_rules = '',
        follow_mouse = 1, sensitivity = 0,
        touchpad = { natural_scroll = false },
    },
    ecosystem = { no_update_news = false, no_donation_nag = false },
})
hl.device({ name = 'epic-mouse-v1', sensitivity = -0.8 })

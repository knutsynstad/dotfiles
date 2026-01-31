#!/bin/bash

spotify &
sleep 0.5

hyprctl dispatch bringactivetotop
hyprctl dispatch resizeactive 800 600
hyprctl dispatch centerwindow

# Reapply border and rounding manually
hyprctl dispatch setwindowrounding 10

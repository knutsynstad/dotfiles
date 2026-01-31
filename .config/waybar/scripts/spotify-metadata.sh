#!/bin/bash

player_status=$(playerctl -p spotify status 2>/dev/null)

if [ "$player_status" = "Playing" ]; then
    artist=$(playerctl -p spotify metadata artist)
    title=$(playerctl -p spotify metadata title)
    artist=$(echo "$artist" | sed 's/&/&amp;/g')
    title=$(echo "$title" | sed 's/&/&amp;/g')
    echo '{"text": "'"$artist - $title" '", "class": "custom-spotify", "alt": "Spotify"}'
else
    echo '{"text": "", "class": "custom-spotify", "alt": "Spotify Idle"}'
fi

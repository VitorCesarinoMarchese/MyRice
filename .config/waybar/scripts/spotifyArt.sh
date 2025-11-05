#!/bin/bash

FORMAT_FILE="/tmp/waybar_spotify_format"
[ ! -f "$FORMAT_FILE" ] && echo "0" >"$FORMAT_FILE"
read FORMAT <"$FORMAT_FILE"

if [ "$FORMAT" -eq 0 ]; then
  META="{{ trunc(artist,17) }} - {{ trunc(title,17) }}"
else
  META="{{ trunc(album,17) }} - {{ trunc(title,17) }}"
fi

status="$(playerctl --player=spotify status 2>/dev/null)"
ICON=" "
output="$ICON$(playerctl metadata --player=spotify --format "$META")"

# Get album art URL and download it
arturl="$(playerctl --player=spotify metadata mpris:artUrl 2>/dev/null)"
img="/tmp/spotify_art.jpg"
if [[ "$arturl" =~ ^https?:// ]]; then
  # Download the image (requires curl or wget)
  curl -sL "$arturl" --output "$img"
fi

# Tooltip with image (Waybar supports image in tooltip via Markdown)
if [ -f "$img" ]; then
  tooltip="<img src="$img"></img>"
else
  tooltip="Spotify Status"
fi

jq -n --arg text "$output" --arg tooltip "$tooltip" '{"text":$text, "tooltip":$tooltip, "class":"music"}'

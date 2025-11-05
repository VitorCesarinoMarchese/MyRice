#!/bin/bash

# --- CONFIG ---
FORMAT_FILE="/tmp/waybar_spotify_format"

# --- Ensure playerctl-loop (optional, for instant updates) ---
if command -v playerctl-loop >/dev/null 2>&1; then
  pidof -x playerctl-loop >/dev/null 2>&1 || playerctl-loop >/dev/null 2>&1 &
fi

# --- Read current format setting ---
[ ! -f "$FORMAT_FILE" ] && echo "0" >"$FORMAT_FILE"
read -r FORMAT <"$FORMAT_FILE"

# --- Get first available player (spotify, firefox, vlc, etc.) ---
PLAYER=$(playerctl --list-all 2>/dev/null | head -n 1)

# ---- Click handlers (called via args from Waybar) ----
case "$1" in
playpause)
  [ -n "$PLAYER" ] && playerctl --player="$PLAYER" play-pause
  exit 0
  ;;
mixer)
  setsid -f kitty -e pulsemixer
  exit 0
  ;;
volup)
  pulsemixer --change-volume +5
  exit 0
  ;;
voldown)
  pulsemixer --change-volume -5
  exit 0
  ;;
toggle)
  echo "$(((FORMAT + 1) % 2))" >"$FORMAT_FILE"
  # Refresh Waybar if you set "signal": 9 in the module
  pkill -RTMIN+9 waybar 2>/dev/null
  exit 0
  ;;
esac

# --- No player running ---
if [ -z "$PLAYER" ]; then
  echo '{"text": "󰎊", "class": "music"}'
  exit 0
fi

# --- Check player status ---
status="$(playerctl --player="$PLAYER" status 2>/dev/null)"

if [ -z "$status" ]; then
  echo '{"text": "󰝛", "class": "music"}'
  exit 0
fi

# --- Choose metadata format ---
if [ "$FORMAT" -eq 0 ]; then
  META="{{ trunc(title,15) }} - {{ trunc(artist,15) }}"
else
  META="{{ trunc(title,15) }} - {{ trunc(album,15) }}"
fi

# --- Set icon based on status ---
if [ "$status" = "Playing" ]; then
  ICON=" "
else
  ICON=" "
fi

# --- Get metadata ---
output="$ICON$(playerctl metadata --player="$PLAYER" --format "$META" 2>/dev/null)"

# --- Escape quotes for JSON ---
output=$(echo "$output" | sed 's/"/\\"/g')

# --- Output JSON for Waybar ---
echo "{\"text\": \"$output\", \"tooltip\": \"${PLAYER^} Status\", \"class\": \"music\"}"

#!/bin/bash

# Get current brightness (as a percentage)
BRIGHTNESS=$(brightnessctl get)
MAX_BRIGHTNESS=$(brightnessctl max)
PERCENT=$((100 * BRIGHTNESS / MAX_BRIGHTNESS))

# Output JSON to format with icon
echo "{\"text\": \"$PERCENT% \", \"tooltip\": false, \"class\": \"brightness\"}"

#!/bin/bash

if ! bluetoothctl show &>/dev/null; then
  echo '{"text": " Error", "class": "off"}'
  exit 1
fi

if bluetoothctl show | grep -q "Powered: yes"; then
  if bluetoothctl devices Connected | grep -q "Device"; then
    echo '{"text": "On 󰂱", "class": "connected"}'
  else
    echo '{"text": "On ", "class": "on"}'
  fi
else
  echo '{"text": "Off 󰂲", "class": "off"}'
fi

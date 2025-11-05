#!/bin/bash

if pgrep -x "wlsunset" >/dev/null; then
  pkill wlsunset
else
  wlsunset -l -23.55 -L -46.63 -t 2500 &
fi

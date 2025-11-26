#!/bin/bash
volume_status=$(wpctl status | grep -i "audio" | grep -i "*" | head -n1)
if echo $volume_status | grep -q "MUTED"; then
  notify-send "    Volume Muted"
else
  notify-send "    Volume Unmuted"
fi

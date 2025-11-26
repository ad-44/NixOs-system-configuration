#!/bin/bash
brightness=$(cat /sys/class/backlight/amdgpu_bl1/actual_brightness)
max_brightness=$(cat /sys/class/backlight/amdgpu_bl1/max_brightness)
percentage=$((brightness*100/max_brightness))
notify-send "󰃟  $percentage%"

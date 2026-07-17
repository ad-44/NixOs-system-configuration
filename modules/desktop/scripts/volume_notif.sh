#!/bin/bash
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
vol_number=${volume:8}
max=100
vol_percentage=$(echo $vol_number*$max | bc)
notify-send "   $vol_percentage%"

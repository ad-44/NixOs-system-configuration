#!/bin/bash
mic_toggle=$(cat /sys/class/leds/platform::micmute/brightness)
if [ $mic_toggle -eq 1 ]
then
  notify-send "󰍭  Microphone Muted"
elif [ $mic_toggle -eq 0 ]
then
  notify-send "󰍬  Microphone Unmuted"  
fi

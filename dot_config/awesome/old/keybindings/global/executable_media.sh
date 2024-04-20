#!/usr/bin/env sh

notify-send "Volume is set to $(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1)%"

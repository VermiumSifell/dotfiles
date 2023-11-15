#!/usr/bin/env sh

notify-send "Volume is set to $(playerctl metadata --format "{{ volume * 100 }}")%"

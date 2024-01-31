#!/bin/bash

current_brightness=$(brightnessctl --device='tpacpi::kbd_backlight' get)

if [ $current_brightness -eq 0 ]; then
  brightnessctl --device='tpacpi::kbd_backlight' set 2
else
  brightnessctl --device='tpacpi::kbd_backlight' set 0
fi

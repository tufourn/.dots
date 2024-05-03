#!/bin/zsh

# set monitor vars
screen_laptop="eDP-1"
screen_mid="DP-1-0"
screen_right="HDMI-1"

xrandr --output $screen_laptop --pos 0x1480
i3-msg workspace 1 output $screen_laptop

if xrandr | grep "$screen_mid connected"; then
  xrandr --output $screen_mid --mode 2560x1440 --rate 169.83 --pos 1920x760
  i3-msg "workspace 2 output $screen_mid"
else
  i3-msg "workspace 2 output $screen_laptop"
fi

if xrandr | grep "$screen_right connected"; then
  xrandr --output $screen_right --mode 2560x1440 --rate 144.00 --rotate right --pos 4480x0
  i3-msg "workspace 3 output $screen_right"
else
  i3-msg "workspace 3 output $screen_laptop"
fi

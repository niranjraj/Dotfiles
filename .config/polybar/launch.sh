#!/bin/bash

#Terminate already running bar instances
killall -q polybar

#Wait until the processes have beet shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#Launch Polybar,using default config location ~/.config/polybar/config
polybar -rq sys &
polybar -rq app &
polybar -rq time&
polybar -rq bspwm &


echo "Polybar launched..."

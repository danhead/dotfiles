#!/usr/bin/env sh

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -c ~/.dotfiles/polybar/config magnumtop &
polybar -c ~/.dotfiles/polybar/config magnumbottom &
echo "Bars launched..."

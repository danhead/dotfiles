#!/usr/bin/env sh

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -c ~/.dotfiles/polybar/config top &
polybar -c ~/.dotfiles/polybar/config bottom &
polybar -c ~/.dotfiles/polybar/config bottom2 &
echo "Bars launched..."

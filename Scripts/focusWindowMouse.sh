#!/bin/sh

while true; do
  CURSOR_X=$(hyprctl cursorpos | cut -d',' -f1)
  if [ $CURSOR_X -eq 0 ]; then
    hyprctl dispatch movefocus l
  elif [ $CURSOR_X -eq 1439 ]; then
    hyprctl dispatch movefocus r
  fi
  sleep 0.1
done

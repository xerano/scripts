#!/usr/bin/bash

sleep 0.1

LVDS_NAME=$(xrandr --query | grep "LVDS" | grep " connected" | cut -d ' ' -f 1)
PREV=$LVDS_NAME

CMD="--output $LVDS_NAME --auto"

for output in `xrandr --query | grep "DP" | grep " connected" | cut -d ' ' -f 1`; do
  CMD="$CMD --output $output --right-of $PREV"
  PREV=$output
done

echo "xrandr $CMD"

xrandr $CMD

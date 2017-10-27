#!/bin/bash

sleep 0.1

for output in `xrandr --query | grep " connected" | cut -d ' ' -f 1`; do
  echo $output
  xrandr --output $output --auto
done

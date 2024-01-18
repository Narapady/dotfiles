#!/bin/bash

# echo $INFO
source "$CONFIG_DIR/colors.sh" # Loads all defined colors

if [ $SELECTED = true ]; then
	sketchybar --set $NAME background.drawing=on \
		background.color=$BASE_BLACK \
		label.color=$TEAL \
		icon.color=$TEAL
else
	sketchybar --set $NAME background.drawing=off \
		label.color=$ICON_COLOR \
		icon.color=$ICON_COLOR
fi


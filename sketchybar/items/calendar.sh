#!/usr/bin/env bash

COLOR="$BLUE"

sketchybar --add item calendar left \
	--set calendar update_freq=15 \
	icon.color="$COLOR" \
	icon.padding_left=10 \
	label.color="$COLOR" \
	label.padding_right=10 \
	background.height=26 \
	background.padding_right=0 \
	background.padding_left=0 \
	background.color="$TRANSPARENT" \
	background.drawing=on \
	script="$PLUGIN_DIR/calendar.sh"

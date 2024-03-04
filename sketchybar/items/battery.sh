#!/usr/bin/env bash

COLOR="$CYAN"

sketchybar --add item battery left \
	--set battery \
	update_freq=60 \
	icon.color="$COLOR" \
	icon.padding_left=10 \
	label.padding_right=10 \
	label.color="$COLOR" \
	background.height=26 \
	background.padding_left=0 \
	background.padding_right=0 \
	background.color="$TRANSPARENT" \
	background.drawing=on \
	script="$PLUGIN_DIR/power.sh" \
	--subscribe battery power_source_change

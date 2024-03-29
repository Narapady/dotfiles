#!/usr/bin/env bash

COLOR="$CYAN"

sketchybar --add item clock right \
	--set clock update_freq=1 \
	icon.padding_left=10 \
	icon.color="$COLOR" \
	icon="" \
	label.color="$COLOR" \
	label.padding_right=5 \
	label.width=78 \
	align=center \
	background.height=26 \
	background.padding_right=2 \
	background.padding_left=0 \
	background.color="$BLACK" \
	background.drawing=on \
	script="$PLUGIN_DIR/clock.sh"

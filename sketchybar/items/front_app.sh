#!/bin/bash

sketchybar --add item front_app left \
	--set front_app background.color=$BASE_BLACK icon.color=$ORANGE \
	icon.font="sketchybar-app-font:Regular:16.0" \
	label.color=$ORANGE \
	script="$PLUGIN_DIR/front_app.sh" \
	--subscribe front_app front_app_switched

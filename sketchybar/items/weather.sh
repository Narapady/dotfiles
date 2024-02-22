#!/usr/bin/env bash

weather=(
	script="$PLUGIN_DIR/weather.sh"
	"${menu_defaults[@]}"
	popup.align=right
	update_freq=300
	icon.padding_right=0
	updates=on
	click_script="sketchybar --set $NAME popup.drawing=toggle; open -a /System/Applications/Weather.app"
	--subscribe weather wifi_change
	mouse.entered
	mouse.exited
	mouse.exited.global
)
COLOR="$PINK"

sketchybar --add item weather right \
	--set weather "${weather[@]}" \
	--add item weather.details popup.weather \
	--set weather.details "${menu_item_defaults[@]}" icon.drawing=off label.padding_left=0 \
	update_freq=3 \
	icon.color="$COLOR" \
	icon.padding_left=10 \
	label.color="$COLOR" \
	label.padding_right=10 \
	background.height=26 \
	background.corner_radius="$CORNER_RADIUS" \
	background.padding_right=5 \
	background.border_width="$BORDER_WIDTH" \
	background.color="$BLACK" \
	background.drawing=on

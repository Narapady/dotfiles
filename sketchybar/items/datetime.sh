#!/bin/env/bash
sketchybar \
	--add item date right \
	--set date update_freq=60 \
	label.font="$FONT:Bold:15" \
	label.color=$BLUE align=right \
	icon.drawing=off \
	label.padding_right=4 \
	script='sketchybar --set $NAME label="$(date "+%a, %b %d %I:%M %p")"' \
	--subscribe date system_woke \
	--set date.details "${menu_item_defaults[@]}"

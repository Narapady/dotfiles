#!/usr/bin/env bash

COLOR="$CYAN"

sketchybar \
	--add item front_app center \
	--set front_app script="$PLUGIN_DIR/front_app.sh" \
	background.height=26 \
	background.padding_left=0 \
	background.padding_right=0 \
	background.color="$BLACK" \
	label.color="$COLOR" \
	label.padding_left=0 \
	label.padding_right=10 \
	associated_display=active \
	--subscribe front_app front_app_switched

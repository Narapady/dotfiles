#!/bin/bash

# Register custom event - this will be use by sketchybar's space items as well as app_space.sh
sketchybar --add event window_change
SPACE_SIDS=(1 2 3 4 5 6 7 8 9 10)

for sid in "${SPACE_SIDS[@]}"; do
	sketchybar --add space space.$sid left \
		--set space.$sid space=$sid \
		icon=$sid \
		icon.color=$PINK \
		icon.padding_left=10 \
		label.font="sketchybar-app-font:Regular:15.0" \
		label.padding_right=20 \
		background.height=26 \
		background.color="$BLACK" \
		background.padding_left=0 \
		background.padding_right=0 \
		script="$PLUGIN_DIR/spaces.sh"
done

sketchybar --add item space_separator center \
	--set space_separator icon="" \
	icon.color="$WHITE" \
	icon.padding_left=10 \
	label.font="sketchybar-app-font:Regular:15.0" \
	label.padding_right=5 \
	background.height=26 \
	background.color="$BLACK" \
	background.padding_left=0 \
	background.padding_right=0 \
	background.drawing=on \
	script="$PLUGIN_DIR/space_windows.sh" \
	--subscribe space_separator space_windows_change

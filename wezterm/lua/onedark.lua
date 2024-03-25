local M = {}
local palette = {
	base = "#2E3440",
	overlay = "#2d3343",
	muted = "#343e4f",
	text = "#abb2bf",
	love = "#ef5f6b",
	gold = "#ebc275",
	rose = "#d99a5e",
	pine = "#4dbdcb",
	foam = "#97ca72",
	iris = "#ca72e4",
	highlight_high = "#8f36a9",
}

local active_tab = {
	bg_color = palette.overlay,
	fg_color = palette.text,
}

function M.colors()
	return {
		foreground = palette.text,
		background = palette.base,
		cursor_bg = palette.highlight_high,
		cursor_border = palette.highlight_high,
		cursor_fg = palette.text,
		selection_bg = "#2a283e",
		selection_fg = palette.text,

		ansi = {
			palette.overlay,
			palette.love,
			palette.pine,
			palette.gold,
			palette.foam,
			palette.iris,
			palette.rose,
			palette.text,
		},

		brights = {
			palette.muted,
			palette.love,
			palette.pine,
			palette.gold,
			palette.foam,
			palette.iris,
			palette.rose,
			palette.text,
		},

		tab_bar = {
			background = palette.base,
			active_tab = active_tab,
			inactive_tab = inactive_tab,
			inactive_tab_hover = active_tab,
			new_tab = inactive_tab,
			new_tab_hover = active_tab,
			inactive_tab_edge = palette.muted, -- (Fancy tab bar only)
		},
	}
end

function M.window_frame() -- (Fancy tab bar only)
	return {
		active_titlebar_bg = palette.base,
		inactive_titlebar_bg = palette.base,
	}
end

return M

local m = {}
local palette = {
  base = "#16181a", -- #24283b
  overlay = "#3c4048",
  muted = "#1e2124",
  text = "#ffffff",
  love = "#ff6e5e",
  gold = "#f1ff5e",
  rose = "#0db9d7",
  pine = "#5ef1ff",
  foam = "#5eff6c",
  iris = "#ff5ea0",
  highlight_high = "#c0caf5",
}

local active_tab = {
  bg_color = palette.overlay,
  fg_color = palette.text,
}

function m.colors()
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
      inactive_tab_edge = palette.muted, -- (fancy tab bar only)
    },
  }
end

function m.window_frame() -- (fancy tab bar only)
  return {
    active_titlebar_bg = palette.base,
    inactive_titlebar_bg = palette.base,
  }
end

return m

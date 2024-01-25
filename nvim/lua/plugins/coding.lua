return {
  -- multi-select, keymap: ctrl-n
  { "mg979/vim-visual-multi", event = "BufReadPre" },

  -- color brackets
  {
    "HiPhish/nvim-ts-rainbow2",
    event = "BufReadPre",
  },

  -- show color on Hex color code
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
}

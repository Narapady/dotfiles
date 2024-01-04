return {
  -- multi-select, keymap: ctrl-n
  { "mg979/vim-visual-multi", event = "BufReadPre" },

  -- preview definition/references
  {
    "rmagatti/goto-preview",
    event = "BufReadPre",
    config = function()
      require("goto-preview").setup()
    end,
  },
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
  -- LF in neovim
  {
    "lmburns/lf.nvim",
    cmd = "Lf",
    dependencies = {
      "akinsho/toggleterm.nvim",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      border = "single",
      escape_quit = true,
      highlights = { NormalFloat = { guibg = "NONE" } },
      winblend = 0,
    },
    keys = {
      { mode = "n", "lf", "<cmd>Lf<cr>", desc = "Lf" },
    },
  },
}

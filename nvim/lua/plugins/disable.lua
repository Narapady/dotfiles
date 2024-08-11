return {
  -- { "akinsho/bufferline.nvim",          enabled = false },
  { "linux-cultist/venv-selector.nvim", enabled = false },
  { "stevearc/conform.nvim",            enabled = false },
  {
    "folke/styler.nvim",
    priority = 1000,
    enabled = false,
    config = function()
      require("styler").setup({
        themes = {
          markdown = { colorscheme = "tokyonight" },
        },
      })
    end,
  },
}

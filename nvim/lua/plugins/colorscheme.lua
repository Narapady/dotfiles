return {
  {
    "craftzdog/solarized-osaka.nvim",
    priority = 1000,
    lazy = true,
    opts = function()
      return {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
          comments = { italic = true },
          keywords = { italic = true },
          functions = { italic = true },
        },
        semantic_tokens = true,
      }
    end,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = function()
      return {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
          comments = { italic = true },
          keywords = { italic = true },
          functions = { italic = true },
        },
        semantic_tokens = true,
      }
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    name = "tokyonight",
    opts = function()
      return {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
          comments = { italic = true },
          keywords = { italic = true },
          functions = { italic = true },
        },
        semantic_tokens = true,
      }
    end,
  },
}

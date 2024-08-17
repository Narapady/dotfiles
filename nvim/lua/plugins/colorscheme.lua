local base = {
  maroon = "#F29BA7",
  peach = "#ff9b5e",
  red = "#ff657a",
  yellow = "#eccc81",
  green = "#a8be81",
  teal = "#9cd1bb",
  sky = "#A6C9E5",
  sapphire = "#86AACC",
  blue = "#5d81ab",
  lavender = "#66729C",
  mauve = "#b18eab",
}

local extend_base = function(value)
  return vim.tbl_extend("force", base, value)
end

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
          conditionals = { italic = true },
          loops = { italic = true },
          -- functions = { italic = true },
        },
        semantic_tokens = true,
      }
    end,
  },
  {
    "oxfist/night-owl.nvim",
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
          conditionals = { italic = true },
          loops = { italic = true },
          -- functions = { italic = true },
        },
        semantic_tokens = true,
      }
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        transparent = false,

        -- Enable italics comments
        italic_comments = false,

        -- Replace all fillchars with ' ' for the ultimate clean look
        hide_fillchars = false,

        -- Modern borderless telescope theme
        borderless_telescope = true,

        -- Set terminal colors used in `:terminal`
        terminal_colors = true,
      })
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    priority = 1000,
    lazy = true,
    config = function()
      require("github-theme").setup({
        options = {
          theme_style = "dimmed",
          transparent = true,
        },
      })
    end,
  },
  {
    "catppuccin",
    optional = true,
    opts = function()
      ---@type CatppuccinOptions
      return {
        background = {
          dark = "frappe",
          light = "latte",
        },
        transparent_background = true,
        color_overrides = {
          latte = extend_base({
            text = "#202027",
            subtext1 = "#263168",
            subtext0 = "#4c4f69",
            overlay2 = "#737994",
            overlay1 = "#838ba7",
            base = "#fcfcfa",
            mantle = "#EAEDF3",
            crust = "#DCE0E8",
            pink = "#EA7A95",
            mauve = "#986794",
            red = "#EC5E66",
            peach = "#FF8459",
            yellow = "#CAA75E",
            green = "#87A35E",
          }),
          frappe = extend_base({
            text = "#fcfcfa",
            surface2 = "#535763",
            surface1 = "#3a3d4b",
            surface0 = "#30303b",
            base = "#202027",
            mantle = "#1c1d22",
            crust = "#171719",
          }),
        },
      }
    end,
  },

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
        comments = { italic = true },
        keywords = { italic = true },
        functions = { italic = false },
      },
    },
  },
  -- nightfly
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = true,
    priority = 1000,
    config = function()
      vim.g.nightflyTransparent = true
      vim.g.nightflyNormalFloat = true
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        highlight_groups = {
          -- borderless telesecope
          -- TelescopeBorder = { fg = "overlay", bg = "surface" },
          -- TelescopeNormal = { fg = "subtle", bg = "surface" },
          -- TelescopeSelection = { fg = "text", bg = "highlight_med" },
          -- TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
          -- TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },
          --
          -- TelescopeTitle = { fg = "base", bg = "love" },
          -- TelescopePromptTitle = { fg = "base", bg = "pine" },
          -- TelescopePreviewTitle = { fg = "base", bg = "iris" },
          --
          -- TelescopePromptNormal = { fg = "text", bg = "surface" },
          -- TelescopePromptBorder = { fg = "surface", bg = "surface" },

          -- transparent telescope
          TelescopeBorder = { fg = "highlight_high", bg = "none" },
          TelescopeNormal = { bg = "none" },
          TelescopePromptNormal = { bg = "none" },
          TelescopeResultsNormal = { fg = "subtle", bg = "none" },
          TelescopeSelection = { fg = "text", bg = "base" },
          TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
        },
        styles = {
          bold = true,
          italic = false,
          transparency = true,
        },
        dark_variant = "dawn",
      })
    end,
  },
  -- Kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        overrides = function(colors)
          local theme = colors.theme
          return {
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          }
        end,
      })
    end,
  },
  {
    "shaunsingh/nord.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      vim.g.nord_contrast = false
      vim.g.nord_borders = false
      vim.g.nord_disable_background = false
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false
      require("nord").set()
    end,
  },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "cool", -- deep, darker, cool, warm, warmer
      })
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized-osaka",
    },
  },
}

return {
  -- multi-select, keymap: ctrl-n
  { "mg979/vim-visual-multi" },

  -- preview definition/references
  {
    "rmagatti/goto-preview",
    event = "VeryLazy",
    config = function()
      require("goto-preview").setup()
    end,
  },
  -- color brackets
  {
    "HiPhish/nvim-ts-rainbow2",
  },

  -- note taking
  {
    "nvim-neorg/neorg",
    event = "BufReadPre",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      })
    end,
  },

  -- show color on Hex color code
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
}

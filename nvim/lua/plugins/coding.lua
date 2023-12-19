return {

  -- -- python debugger
  -- {
  --   "mfussenegger/nvim-dap-python",
  -- -- stylua: ignore
  -- keys = {
  --   { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
  --   { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
  -- },
  --   config = function()
  --     local path = require("mason-registry").get_package("debugpy"):get_install_path()
  --     require("dap-python").setup(path .. " .local/share/nvim/mason/packages/debugpy/venv/bin/python")
  --   end,
  -- },
  -- multi-select
  { "mg979/vim-visual-multi" },

  -- rename variable -recursively
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- file code symbole outline
  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    cmd = "SymbolsOutline",
    opts = {
      position = "right",
    },
  },

  -- note taking
  {
    "nvim-neorg/neorg",
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
}

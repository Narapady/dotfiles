return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change a keymap
    keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<CR>" }
    -- add a keymap
    keys[#keys + 1] = { "gh", "<cmd>Lspsaga peek_definition<CR>" }
  end,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  opts = {
    servers = {
      pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
              diagnosticMode = "off",
            },
          },
        },
      },
    },
  },
}

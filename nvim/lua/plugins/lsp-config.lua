return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "K", "<cmd>Lspsaga hover_doc<CR>" }
    keys[#keys + 1] = { "gh", "<cmd>Lspsaga peek_definition<CR>" }
    keys[#keys + 1] = { "<leader>rn", "<cmd>Lspsaga rename<CR>" }
    keys[#keys + 1] = { "go", "<cmd>Lspsaga outgoing_calls<CR>" }
    keys[#keys + 1] = { "gi", "<cmd>Lspsaga incoming_calls<CR>" }
    keys[#keys + 1] = { "gf", "<cmd>Lspsaga finder<CR>" }
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
      ruff_lsp = {},
    },
    setup = {
      ruff_lsp = function()
        require("lazyvim.util").lsp.on_attach(function(client, _)
          if client.name == "ruff_lsp" then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end
        end)
      end,
    },
  },
}

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

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
    },
  },
}

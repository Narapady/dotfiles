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
              diagnosticSeverityOverrides = {
                reportGeneralTypeIssues = "information",
                reportPrivateImportUsage = "information",
                reportOptionalOperand = "information",
                reportOptionalSubscript = "information",
                reportOptionalMemberAccess = "information",
              },
            },
          },
        },
      },
      ruff_lsp = {
        init_options = {
          settings = {
            args = {
              "--extend-select",
              "W,C90,UP,ASYNC,S,B,A,COM,C4,DTZ,T10,EXE,ISC,ICN,G,INP,PIE,PYI,PT,RET,SIM,TID,TCH,PL,TRY,PD,NPY,PERF",
              "--ignore",
              "E402,E501,W291,PLR0913,W293,S101,RET504,RET505,C901,TRY003,F401,PLR0915,COM812,PLR2004,S301,S311,PIE808,B007,UP039,SIM300,PLR5501",
            },
          },
        },
      },
    },
  },
}

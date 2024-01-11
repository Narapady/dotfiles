return {
  --transparent window
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    keys = { "<leader>T", "<cmd>TransparentToggle<CR>", desc = "Toggle Transparent" },
  },

  -- Preview markdown
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      -- refer to `configuration to change defaults`
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },

  -- config notify.nvim
  {
    "rcarriga/nvim-notify",
    event = "BufRead",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
    end,
  },
  -- hide taps
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        -- separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- lsp saga
  -- only use breadcrumb feature
  {
    "nvimdev/lspsaga.nvim",
    event = "BufReadPre",
    keys = {
      { "<leader>ol", "<cmd>Lspsaga outline<CR>", desc = "Show Outline" },
    },
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          show_file = false,
        },
        ui = {
          code_action = "", -- disable lightbulb
        },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },
  -- change starting dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
      sS         .s5SSSs.  .s5SSSSs. .s5 s.  .s    s.  s.  .s5ssSs.
      sS              SS.       SSS     SS.       SS. SS.    SS SS.
      SS        sS    S%S     sSSS  ssS SSS sS    S%S S%S sS SS S%S
      SS        SSSs. S%S    sSS"    SSSSS  SS    S%S S%S SS :; S%S
      SS        SS    S%S   sSS       SSS    SS   S%S S%S SS    S%S
      SS        SS    `:;  sSS        `:;    SS   `:; `:; SS    `:;
      SS    ;,. SS    ;,. sSS         ;,.     SS  ;,. ;,. SS    ;,.
      `:;;;;;:' :;    ;:' `:;;;;;:'   ;:'      `:;;:' ;:' :;    ;:'
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}

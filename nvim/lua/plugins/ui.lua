return {
  --transparent window
  { "xiyaowong/transparent.nvim" },

  -- allow transparent for notify.nvim
  -- {
  --   "rcarriga/nvim-notify",
  --   event = "BufReadPre",
  --   opts = {
  --     background_colour = "#000000",
  --   },
  -- },
  -- hight tab
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

  -- show file name to match with solarized theme
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },
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

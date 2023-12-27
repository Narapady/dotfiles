return {
  --transparent window
  { "xiyaowong/transparent.nvim" },

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

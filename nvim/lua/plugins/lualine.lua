return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons", "nvimdev/lspsaga.nvim" },
  opts = {},
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = {
          normal = {
            c = { fg = "#00000000", bg = "#00000000" },
          },
        },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "dashboard" },
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      inactive_section = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      sections = {},
      tabline = {},
      winbar = {
        lualine_z = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " " },
          },
          {
            "diff",
            colored = true, -- Displays a colored diff status if set to true
            symbols = { added = " ", modified = " ", removed = " " }, -- Changes the symbols used by the diff.
            separator = "",
            padding = { left = 1, right = 0 }
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", colored = true, path = 4, separator = "", padding = { left = 0, right = 0 } },
          { "branch", color = { fg = "#F29BA7" }, icon = "󰘬", separator = "", padding = { left = 1, right = 0 } },
          -- { "mode", color = { fg = "#31748f" }, separator = "", padding = { left = 1, right = 0 } },
          -- { "location", color = { fg = "#e0af68", gui = "bold" }, separator = "", padding = { left = 1, right = 0 } },
          -- { "progress", color = { fg = "#e0af68" }, separator = "", padding = { left = 1, right = 0 } },
        },
        lualine_b = {
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_a = {
          {
            require('tmux-status').tmux_session,
            cond = require('tmux-status').show,
            padding = { left = 3 },
          },
          {
            require('tmux-status').tmux_windows,
            cond = require('tmux-status').show,
            padding = { left = 3 },
          },
          -- { "mode",     color = { fg = "#a8be81" }, separator = "", padding = { left = 1, right = 0 } },
          { "location", color = { fg = "#ff9b5e" }, separator = "", padding = { left = 1, right = 0 } },
          { "progress", color = { fg = "#ff657a" }, separator = "", padding = { left = 1, right = 0 } },
          -- {
          --   function()
          --     local breadcrum = require("lspsaga.symbol.winbar").get_bar()
          --     if breadcrum ~= nil then
          --       return breadcrum
          --     else
          --       return ""
          --     end
          --   end,
          -- },
        },
      },
      inactive_winbar = {
        lualine_x = {
          { "filetype", icon_only = true, colored = true },
          { "filename" },
        },
      },
      extensions = {},
    })
  end,
}

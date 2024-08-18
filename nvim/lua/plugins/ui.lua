return {
  {
    "christopher-francisco/tmux-status.nvim",
    lazy = false,
    enabled = false,
    opts = {
      window = {
        separator = "  ",
        icon_zoom = "",
        icon_mark = "",
        icon_bell = "",
        icon_mute = "",
        icon_activity = "",
        text = "dir",
      },
      session = {
        icon = " "
      },
      datetime = {
        icon = "󱑍",
        format = "%a %d %b %k:%m",
      },
      battery = {
        icon = "󰂎",
      },
      colors = {
        window_active = "#EA7A95",
        window_inactive = "#87A35E",
        window_inactive_recent = "#87A35E",
        session = "#FF8459",
      },
      force_show = false, -- Force components to be shown regardless of Tmux status
      manage_tmux_status = true,
    },
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    keys = { "<leader>T", "<cmd>TransparentToggle<CR>", desc = "Toggle Transparent" },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "BufRead",
    enabled = false,
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
    end,
  },
  {
    "DreamMaoMao/yazi.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },

    keys = {
      { ";e", "<cmd>Yazi<CR>", desc = "Toggle Yazi" },
    },
  },
}

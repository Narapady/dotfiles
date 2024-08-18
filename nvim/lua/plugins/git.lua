return {
  {
    "dinhhuy258/git.nvim",
    event = "BufReadPre",
    opts = {
      keymaps = {
        -- Open blame window
        blame = "<Leader>gb",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = {
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", ";h", gs.preview_hunk_inline, "Preview Hunk Inline")
      end,
    },
  },
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
      "DiffviewFileHistory",
    },
    opts = {
      file_panel = {
        win_config = {
          position = "bottom",
          height = 10,
        }
      },
      hooks = {
        view_opened = function()
          local stdout = vim.loop.new_tty(1, false)
          if stdout ~= nil then
            stdout:write(
              ("\x1bPtmux;\x1b\x1b]1337;SetUserVar=%s=%s\b\x1b\\"):format(
                "DIFF_VIEW",
                vim.fn.system({ "base64" }, "+4")
              )
            )
            vim.cmd([[redraw]])
          end
        end,
        view_closed = function()
          local stdout = vim.loop.new_tty(1, false)
          if stdout ~= nil then
            stdout:write(
              ("\x1bPtmux;\x1b\x1b]1337;SetUserVar=%s=%s\b\x1b\\"):format(
                "DIFF_VIEW",
                vim.fn.system({ "base64" }, "-1")
              )
            )
            vim.cmd([[redraw]])
          end
        end,
      },
    },
    keys = {
      { ";d",         "<cmd>DiffviewOpen<cr>",        desc = "Diff View Open" },
      { "q",          "<cmd>DiffviewClose<cr>",       desc = "Diff View Close" },
      { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Diff View File History" },
    },
  },
}

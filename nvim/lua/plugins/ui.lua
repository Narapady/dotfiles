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
  {
    "nvimdev/lspsaga.nvim",
    event = "BufReadPre",
    keys = {
      { "<leader>ol", "<cmd>Lspsaga outline<CR>", desc = "Show Outline" },
    },
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          enable = false,
          show_file = false,
        },
        ui = {
          code_action = "",
        },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
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
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "-" },
        topdelete = { text = "-" },
        changedelete = { text = "-" },
        untracked = { text = "?" },
      },
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
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "AndreM222/copilot-lualine", "nvimdev/lspsaga.nvim" },
    opts = {},
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = {
            normal = { c = { fg = "#00000000", bg = "#00000000" } },
          },
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {},
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
        inactive_sections = {
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
          lualine_a = {},
          lualine_b = {
            -- { "branch", color = { fg = "#dcd7ba", gui = "bold" }, icon = "" },
            { "filetype", color = { gui = "bold" }, icon_only = true, colored = true },
            { "filename", color = { gui = "bold" } },
            -- {
            --   function()
            --     local breadcrum = require("lspsaga.symbol.winbar").get_bar()
            --     return breadcrum
            --   end,
            -- },
          },
          lualine_c = {
            {
              "diff",
              colored = true, -- Displays a colored diff status if set to true
              diff_color = {
                -- Same color values as the general color option can be used here.
                added = { gui = "bold" }, -- Changes the diff's added color
                modified = { gui = "bold" }, -- Changes the diff's modified color
                removed = { gui = "bold" }, -- Changes the diff's removed color you
              },
              symbols = { added = "+", modified = "~", removed = "-" }, -- Changes the symbols used by the diff.
            },
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = { error = " ", warn = " ", info = " " },
            },
          },
          lualine_x = {
            { "mode", color = { fg = "#8FBCBB", gui = "bold" } },
            { "location", color = { fg = "#8FBCBB", gui = "bold" } },
            { "progress", color = { fg = "#8FBCBB", gui = "bold" } },
          },
          lualine_y = {
            { "copilot", color = { fg = "#8FBCBB", gui = "bold" } },
            {
              function()
                local msg = "No Active Lsp"
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                  return msg
                end
                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                  end
                end
                return msg
              end,
              icon = "",
              color = { fg = "#8FBCBB", gui = "bold" },
            },
          },
          lualine_z = {},
        },
        inactive_winbar = {},
        extensions = {},
      })
    end,
  },
}

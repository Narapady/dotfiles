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
          code_action = "", -- disable lightbulb
        },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
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
        add = { text = " " },
        change = { text = "  " },
        delete = { text = " " },
        topdelete = { text = " " },
        changedelete = { text = "  " },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

      -- stylua: ignore start
      map("n", ";h", gs.preview_hunk_inline, "Preview Hunk Inline")
      map("n", ";d", gs.diffthis, "Diff This")
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
            normal = { c = { fg = "#ffa066", bg = "#0000000" } },
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
        sections = {},
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {
          lualine_c = {
            { "filetype", color = { fg = "#7fb4ca", gui = "bold" } },
            { "filename", color = { fg = "#7fb4ca", gui = "bold" } },
            {
              function()
                local breadcrum = require("lspsaga.symbol.winbar").get_bar()
                return breadcrum
              end,
            },
          },
          lualine_a = {
            { "mode", color = { fg = "#98bb6c", gui = "bold" } },
            { "branch", color = { fg = "#E46876", gui = "bold" } },
            {
              "diff",
              colored = true, -- Displays a colored diff status if set to true
              diff_color = {
                -- Same color values as the general color option can be used here.
                added = { fg = "#98BB6C", gui = "bold" }, -- Changes the diff's added color
                modified = { fg = "#ffa066", gui = "bold" }, -- Changes the diff's modified color
                removed = { fg = "#E82424", gui = "bold" }, -- Changes the diff's removed color you
              },
              symbols = { added = " ", modified = " ", removed = " " }, -- Changes the symbols used by the diff.
            },
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = { error = " ", warn = " ", info = " " },
            },
          },
          lualine_b = {
            { "location", color = { fg = "#7fb4ca", gui = "bold" } },
            { "progress", color = { fg = "#957fb8", gui = "bold" } },
            { "copilot", color = { fg = "#ffa066", gui = "bold" } },
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
              icon = ":",
              color = { fg = "#E46876", gui = "bold" },
            },
          },
        },
        inactive_winbar = {},
        extensions = {},
      })
    end,
  },
}

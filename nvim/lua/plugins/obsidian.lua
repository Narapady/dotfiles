return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    event = "BufRead",
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("obsidian").setup({
        vim.keymap.set(
          "n",
          "<leader>of",
          "<cmd>ObsidianQuickSwitch<CR>",
          { silent = true, desc = "ObsidianQuickSwitch" }
        ),
        vim.keymap.set("n", "gtl", function()
          if require("obsidian").util.cursor_on_markdown_link() then
            return "<cmd>ObsidianFollowLink<CR>"
          else
            return "gd"
          end
        end, { noremap = false, expr = true }),
        workspaces = {
          {
            name = "Notes",
            path = "/Users/narapadychhuoy/obsidian",
          },
        },
        completion = {
          nvim_cmp = true,
          min_chars = 2,
        },

        new_notes_location = "current_dir",
        wiki_link_func = function(opts)
          return string.format("[[%s]]", opts.path)
        end,
        -- ui = {
        --   enable = true,         -- set to false to disable all additional syntax features
        --   update_debounce = 200, -- update delay after a text change (in milliseconds)
        --   -- Define how various check-boxes are displayed
        --   checkboxes = {
        --     -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
        --     [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        --     ["x"] = { char = "", hl_group = "ObsidianDone" },
        --     [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        --     ["~"] = { char = "󰚃 ", hl_group = "ObsidianTilde" },
        --   },
        --   external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        --   reference_text = { hl_group = "ObsidianRefText" },
        --   highlight_text = { hl_group = "ObsidianHighlightText" },
        --   tags = { hl_group = "ObsidianTag" },
        -- },
      })
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,    -- Recommended
    ft = "markdown", -- If you decide to lazy-load anyway

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("markview").setup({
        modes = { "n", "i", "no", "c" },
        code_blocks = {
          style = "language",
          hl = "CursorLine",
          icons = true,
          language_direction = "left",
          pad_amount = 2,
        },
        headings = {
          enable = true,
          shift_width = 1,
          heading_1 = {
            style = "label",
            hl = "MarkviewHeading6",
          },
          heading_2 = {
            style = "label",
            hl = "MarkviewHeading5"
          },
          heading_3 = {
            style = "label",
            hl = "MarkviewHeading2"
          },
          heading_4 = {
            style = "label",
            hl = "MarkviewHeading1"
          },
          heading_5 = {
            style = "label",
            hl = "MarkviewHeading3"
          },
          heading_6 = {
            style = "label",
            hl = "MarkviewHeading4"
          }
        },
        list_items = {
          marker_minus = {
            text = " "
          },
        },
        inline_codes = {
          enable = true,
          hl = "DiagnosticOk",

          corner_left = nil,
          corner_left_hl = nil,

          padding_left = " ",
          padding_left_hl = nil,

          padding_right = " ",
          padding_right_hl = nil,

          corner_right = nil,
          corner_right_hl = nil
        }

      })
    end,
  },
}

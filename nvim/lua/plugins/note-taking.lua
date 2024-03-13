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
            path = "/Users/narapadychhuoy/Repos/second-brain/",
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
        ui = {
          enable = true, -- set to false to disable all additional syntax features
          update_debounce = 200, -- update delay after a text change (in milliseconds)
          -- Define how various check-boxes are displayed
          checkboxes = {
            -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
            [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
            ["x"] = { char = "", hl_group = "ObsidianDone" },
            [">"] = { char = "", hl_group = "ObsidianRightArrow" },
            ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
          },
          external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
          reference_text = { hl_group = "ObsidianRefText" },
          highlight_text = { hl_group = "ObsidianHighlightText" },
          tags = { hl_group = "ObsidianTag" },
        },
      })
    end,
  },
}

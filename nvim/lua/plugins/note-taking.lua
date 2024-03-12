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

        -- workspaces
        workspaces = {
          {
            name = "Notes",
            path = "/Users/narapadychhuoy/Repos/second-brain/",
          },
        },
        completion = {
          -- Set to false to disable completion.
          nvim_cmp = true,

          -- Trigger completion at 2 chars.
          min_chars = 2,

          -- Where to put new notes created from completion. Valid options are
          --  * "current_dir" - put new notes in same directory as the current buffer.
          --  * "notes_subdir" - put new notes in the default notes subdirectory.
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
  -- https://github.com/lukas-reineke/headlines.nvim
  -- This already comes installed with lazyvim but I modify the heading colors and
  -- also the lines above and below
  -- It also adds these { "◉", "○", "✸", "✿" } symbols in headings

  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = "md",
    config = function()
      -- Define custom highlight groups using Vimscript
      vim.cmd([[highlight Headline1 guibg=#00000000 guifg=white]])
      vim.cmd([[highlight Headline2 guibg=#00000000 guifg=white]])
      vim.cmd([[highlight Headline3 guibg=#00000000 guifg=white]])
      vim.cmd([[highlight Headline4 guibg=#00000000 guifg=white]])
      vim.cmd([[highlight Headline5 guibg=#00000000 guifg=white]])
      vim.cmd([[highlight Headline6 guibg=#00000000 guifg=white]])
      vim.cmd([[highlight CodeBlock guibg=#00000000]])
      vim.cmd([[highlight Dash guifg=#c0caf5]])

      -- Setup headlines.nvim with the newly defined highlight groups
      require("headlines").setup({
        markdown = {
          codeblock_highlight = "CodeBlock",
          headline_highlights = {
            "Headline1",
            "Headline2",
            "Headline3",
            "Headline4",
            "Headline5",
            "Headline6",
          },
        },
      })
    end,
  },
}

return {
  -- Override default telescope
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    opts = {
      defaults = {
        file_ignore_patterns = { ".git/", "node_modules" },
        layout_config = {
          height = 0.90,
          width = 0.90,
          preview_cutoff = 0,
          horizontal = { preview_width = 0.60 },
          vertical = { width = 0.55, height = 0.9, preview_cutoff = 0 },
          prompt_position = "top",
        },
        path_display = { "smart" },
        prompt_position = "top",
        prompt_prefix = "  ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--hidden",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim", -- add this value
        },
      },
      pickers = {
        buffers = {
          prompt_prefix = "󰸩  ",
        },
        commands = {
          prompt_prefix = "  ",
          layout_config = {
            height = 0.63,
            width = 0.78,
          },
        },
        command_history = {
          prompt_prefix = "  ",
          layout_config = {
            height = 0.63,
            width = 0.58,
          },
        },
        git_files = {
          prompt_prefix = "󰊢  ",
          show_untracked = true,
        },
        find_files = {
          prompt_prefix = "  ",
          find_command = { "fd", "-H" },
        },
        live_grep = {
          prompt_prefix = "󰱽 ",
        },
        grep_string = {
          prompt_prefix = "󰱽 ",
        },
      },
    },
    keys = {
      -- list of disabled defualt keymaps
      { "<leader>/", false }, --disable grep keymap
      { "<leader><space>", false }, -- disable find_file keymap
      { "<leader>ff", false }, -- disable find_file keymap
      { "<leader>fb", false }, -- disble buffers keymap
      { "<leader>sd", false }, -- disble show diagnostics keymap
      { "<leader>ff", false }, -- disble file files
      { "<leader>sC", false }, -- disble find commands
      { "<leader>sh", false }, -- disble help tags
      { "<leader>sD", false }, -- disble workspace diagnostics
      { "<leader>sG", false }, -- disble workspace diagnostics

      --  opened buffers
      {
        ";b",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers()
        end,
        desc = "Lists opened buffers",
      },
      {
        ";h",
        function()
          local builtin = require("telescope.builtin")
          builtin.help_tags()
        end,
        desc = "Lists available help tags and opens a new window with the relevant help info",
      },
      --  findd commands
      {
        ";c",
        function()
          local builtin = require("telescope.builtin")
          builtin.commands()
        end,
        desc = "Lists available plugins/users commands",
      },
      {
        ";ff",
        function()
          local builtin = require("telescope.builtin")
          builtin.current_buffer_fuzzy_find()
        end,
        desc = "Live fuzzy search inside of the currently open buffer",
      },
      {
        ";f",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = false,
            hidden = true,
          })
        end,
        desc = "Lists files in your current working directory, respects .gitignore",
      },
      {
        ";r",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end,
        desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
      },
      {
        ";e",
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = "Lists Diagnostics for all open buffers or a specific buffer",
      },
      {
        ";t",
        function()
          local builtin = require("telescope.builtin")
          builtin.treesitter()
        end,
        desc = "Lists Function names, variables, from Treesitter",
      },
      {
        ";s",
        function()
          local builtin = require("telescope.builtin")
          builtin.grep_string()
        end,
        desc = "Find string under cursor",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        mappings = {
          n = {},
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      })
      telescope.setup(opts)
      require("telescope").load_extension("fzf")
    end,
  },
}

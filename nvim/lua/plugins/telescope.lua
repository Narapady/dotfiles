return {
  "nvim-telescope/telescope.nvim",
  -- replace all Telescope keymaps with only one mapping
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    {
      "prochri/telescope-all-recent.nvim",
      dependencies = {
        "kkharji/sqlite.lua",
      },
      opts = {},
    }
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
      selection_caret = "󰅂 ",
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
        prompt_prefix = " 󰸩  ",
      },
      commands = {
        prompt_prefix = "   ",
        layout_config = {
          height = 0.63,
          width = 0.78,
        },
      },
      command_history = {
        prompt_prefix = "   ",
        layout_config = {
          height = 0.63,
          width = 0.58,
        },
      },
      git_files = {
        prompt_prefix = " 󰊢  ",
        show_untracked = true,
      },
      find_files = {
        prompt_prefix = "   ",
        find_command = { "fd", "-H" },
      },
      live_grep = {
        prompt_prefix = " 󰱽 ",
      },
      grep_string = {
        prompt_prefix = " 󰱽 ",
      },
    },
  },
  keys = function()
    return {
      { ";f", "<cmd>Telescope find_files<cr>",                desc = "Find Files" },
      { ";b", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fine in Current Buffer" },
      { ";;", "<cmd>Telescope lsp_document_symbols<cr>",      desc = "Buffer Symbols" },
      { ";r", "<cmd>Telescope live_grep<cr>",                 desc = "Live Grep" },
      { ";s", "<cmd>Telescope grep_string<cr>",               desc = "Search Sting under Cursor" },
      { ";x", "<cmd>Telescope diagnostics<cr>",               desc = "Diagnostics" },
    }
  end,
}

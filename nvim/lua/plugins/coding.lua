return {
  {
    "robitx/gp.nvim",
    event = "VeryLazy",
    config = function()
      local conf = {
        -- For customization, refer to Install > Configuration in the Documentation/Readme
        openai_api_key = os.getenv("OPENAI_API_KEY"),
        cmd_prefix = "Gp",
        agents = {
          {
            name = "ChatGPT4o",
            chat = true,
            command = false,
            -- string with model name or table with model name and parameters
            model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
            -- system prompt (use this to specify the persona/role of the AI)
            system_prompt = require("gp.defaults").chat_system_prompt,
          },
        },
        chat_conceal_model_params = true,
        vim.keymap.set("n", "<leader>al", "<cmd>GpChatToggle popup<CR>", { silent = true, desc = "Chat Toggle" }),
        vim.keymap.set("n", "<leader>ar", "<cmd>GpChatRespond<CR>", { silent = true, desc = "Chat Response" }),
        vim.keymap.set("n", "<leader>as", "<cmd>GpChatStop<CR>", { silent = true, desc = "Chat Stop" }),
        vim.keymap.set("n", "<leader>ad", "<cmd>GpChatDelete<CR>", { silent = true, desc = "Chat Delete" }),
        vim.keymap.set("n", "<leader>an", "<cmd>GpChatNew popup<CR>", { silent = true, desc = "Chat New" }),
        vim.keymap.set({ "n", "v", "i", "x" }, "<leader>ap", ":'<,'>GpChatPaste popup<CR>",
          { silent = true, desc = "Chat Paste" })
      }
      require("gp").setup(conf)

      -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  -- multi-select, keymap: ctrl-n
  { "mg979/vim-visual-multi", event = "BufReadPre" },

  -- show color on Hex color code
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
  { "dnlhc/glance.nvim",      event = "BufReadPre" },
  {
    "echasnovski/mini.bufremove",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<leader>bD", false },
      {
        ";c",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete Buffer",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "LazyFile",
    config = true,
    -- stylua: ignore
    keys = {
      { ";t", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    },
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({})
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    enabled = true,
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
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "mbbill/undotree",
    lazy = false,
    cmd = "UndotreeToggle",
    keys = {
      { ";u", "<cmd>UndotreeToggle<cr>", desc = "Undotree Toggle" },
    },
  },
}

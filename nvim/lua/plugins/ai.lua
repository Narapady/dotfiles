return {
  -- custom config which piggybacks on the copilot extras in lazy.lua.
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          accept = true, -- disable built-in keymapping
        },
      })

      -- hide copilot suggestions when cmp menu is open
      -- to prevent odd behavior/garbled up suggestions
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if cmp_status_ok then
        cmp.event:on("menu_opened", function()
          vim.b.copilot_suggestion_hidden = true
        end)

        cmp.event:on("menu_closed", function()
          vim.b.copilot_suggestion_hidden = false
        end)
      end
    end,
  },
  -- chatgpt plugins
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "op read op://private/API/credential --no-newline", -- read api key from 1password
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      {
        "<C-x>",
        "<cmd>ChatGPTRun explain_code<CR>",
        mode = "v",
      },
      {
        "<leader><space>",
        function()
          require("chatgpt").openChat()
        end,
        desc = "ChatGPT",
        mode = {
          "n",
          "v",
        },
      },
      {
        "<leader>i",
        function()
          require("chatgpt").edit_with_instructions()
        end,
        desc = "ChatGPT Edit With Instruction",
        mode = {
          "n",
          "v",
        },
      },
    },
  },
}

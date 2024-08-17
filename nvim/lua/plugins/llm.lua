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
        vim.keymap.set("n", "<leader><leader>", "<cmd>GpChatToggle popup<CR>", { silent = true, desc = "Chat Toggle" }),
        vim.keymap.set("n", "<leader><leader>r", "<cmd>GpChatRespond<CR>", { silent = true, desc = "Chat Response" }),
        vim.keymap.set("n", "<leader><leader>s", "<cmd>GpChatStop<CR>", { silent = true, desc = "Chat Stop" }),
        vim.keymap.set("n", "<leader><leader>d", "<cmd>GpChatDelete<CR>", { silent = true, desc = "Chat Delete" }),
        vim.keymap.set("n", "<leader><leader>n", "<cmd>GpChatNew popup<CR>", { silent = true, desc = "Chat New" }),
        vim.keymap.set({ "n", "v", "i", "x" }, "<leader><leader>p", ":'<,'>GpChatPaste popup<CR>",
          { silent = true, desc = "Chat Paste" })
      }
      require("gp").setup(conf)

      -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
    end,
  }
}

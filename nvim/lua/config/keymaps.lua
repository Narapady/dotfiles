-- lazygit
-- vim.keymap.set("n", ";g", function()
--   Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
-- end, { desc = "Lazygit (root dir)" })

vim.keymap.set("i", "jj", "<ESC>", { silent = true }) -- exit insert mode
vim.keymap.set("n", ">", "$", { silent = true }) -- > to go to end of line
vim.keymap.set("n", "<", "_", { silent = true }) -- < to go to start of line
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true }) -- quit file
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true }) -- quit file
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv") -- Move current line up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move current line down

-- accept line copilot
vim.keymap.set({ "i", "n" }, "<C-y>", "<cmd>lua require('copilot.suggestion').accept_line()<CR>", { silent = true })
vim.keymap.set({ "i", "n" }, "<C-e>", "<cmd>lua require('copilot.suggestion').accept()<CR>", { silent = true })

-- lazy terminal
-- local Util = require("lazyvim.util")
-- vim.keymap.set("n", "<C-_>", function()
--   Util.terminal(nil, { border = "rounded" })
-- end, { desc = "Term with border" })

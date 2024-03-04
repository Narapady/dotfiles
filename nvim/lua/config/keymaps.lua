-- Global keymaps
local Util = require("lazyvim.util")

vim.keymap.set("i", "jj", "<ESC>", { silent = true }) -- exit insert mode
vim.keymap.set("n", ">", "$", { silent = true }) -- > to go to end of line
vim.keymap.set("n", "<", "_", { silent = true }) -- < to go to start of line
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true }) -- quit file
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true }) -- quit file

-- accept line copilot
vim.keymap.set({ "i", "n" }, "<C-y>", "<cmd>lua require('copilot.suggestion').accept_line()<CR>", { silent = true })
vim.keymap.set({ "i", "n" }, "<C-e>", "<cmd>lua require('copilot.suggestion').accept()<CR>", { silent = true })
-- lazygit
vim.keymap.set("n", ";g", function()
  Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (root dir)" })

-- lazy terminal
vim.keymap.set("n", "<C-_>", function()
  Util.terminal(nil, { border = "rounded" })
end, { desc = "Term with border" })

vim.keymap.set("n", "<leader>D", "<cmd> DiffviewFileHistory<CR>", { silent = true, desc = "DiffviewFileHistory" })

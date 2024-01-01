-- Global keymaps
vim.keymap.set("i", "jj", "<ESC>", { silent = true }) -- exit insert mode
vim.keymap.set({ "i", "n" }, "<C-A>", "ggVG", { silent = true }) -- exit insert mode
vim.keymap.set("n", ">", "$", { silent = true }) -- > to go to end of line
vim.keymap.set("n", "<", "_", { silent = true }) -- < to go to start of line
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true }) -- write file
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true }) -- quit file
vim.keymap.set("n", "<C-u>", ":u<CR>", { silent = true }) -- undo
vim.keymap.set(
  "n",
  "gh",
  "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
  { silent = true, desc = "Preview Definition" }
) -- preview definition

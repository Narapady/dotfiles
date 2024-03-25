-- hide neovim statusline
vim.opt.laststatus = 0
vim.opt.relativenumber = true
vim.opt_local.conceallevel = 2
vim.opt.conceallevel = 2
vim.opt.scrolloff = 20
vim.opt.swapfile = false

-- change the color of the floating window
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#2E3440" })

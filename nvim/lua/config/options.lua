-- hide neovim statusline
vim.opt.laststatus = 0
vim.opt.relativenumber = true
-- vim.opt_local.conceallevel = 2
vim.opt.conceallevel = 2
vim.opt.scrolloff = 20
vim.opt.swapfile = false

-- change the color of the floating window
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "" })

vim.opt.termguicolors = true
vim.g.syntax = "enable"
vim.o.winblend = 0

-- indent
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- ~/.config/nvim/lua/config/options.lua
-- require("lazyvim.util").toggle.diagnostics()

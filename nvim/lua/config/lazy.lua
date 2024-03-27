local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
vim.cmd([[command! -nargs=0 GoToFile :Telescope find_files]])
require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- load plugins from the plugins folder
    { import = "plugins" },
    -- load plugins from the extras provided by lazyVim
    { import = "lazyvim.plugins.extras.formatting.black" }, -- formatting
    -- { import = "lazyvim.plugins.extras.dap.core" }, -- debugger
    -- { import = "lazyvim.plugins.extras.test.core" }, -- neotest
    -- { import = "lazyvim.plugins.extras.lang.python" }, -- pyright, ruff_lsp
    { import = "lazyvim.plugins.extras.coding.yanky" }, -- improve yanky in neovim
    { import = "lazyvim.plugins.extras.coding.codeium" },
    { import = "lazyvim.plugins.extras.lang.terraform" },
    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
  },
  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

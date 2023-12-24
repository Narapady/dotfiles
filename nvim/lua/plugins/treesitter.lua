return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "cpp",
        "html",
        "python",
        "lua",
        "css",
        "fish",
        "gitignore",
        "rust",
        "sql",
      },
      rainbow = {
        enable = true,
      },
    },
  },
}

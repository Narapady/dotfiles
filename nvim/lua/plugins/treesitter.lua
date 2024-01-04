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
        "markdown",
        "markdown_inline",
        "rust",
        "sql",
      },
      highlight = {
        enable = true,
      },
      rainbow = {
        enable = true,
      },
    },
  },
}

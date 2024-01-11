return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
        "python",
        "lua",
        "css",
        "gitignore",
        "markdown",
        "markdown_inline",
        "rust",
        "sql",
        "mermaid",
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

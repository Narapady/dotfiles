return {
  -- database
  { "tpope/vim-dadbod", event = "BufRead" },
  -- fix indent for python
  { "Vimjas/vim-python-pep8-indent", event = "BufReadPre" },
  -- f auto f-string
  {
    "chrisgrieser/nvim-puppeteer",
    event = "BufReadPre",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
}

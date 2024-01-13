return {
  -- database
  { "tpope/vim-dadbod", event = "BufRead" },
  -- fix indent for python
  { "Vimjas/vim-python-pep8-indent", event = "BufReadPre" },

  -- {
  --   "kndndrj/nvim-dbee",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --   },
  --   build = function()
  --     -- Install tries to automatically detect the install method.
  --     -- if it fails, try calling it with one of these parameters:
  --     --    "curl", "wget", "bitsadmin", "go"
  --     require("dbee").install()
  --   end,
  --   config = function()
  --     require("dbee").setup(--[[optional config]])
  --   end,
  -- },
  -- f auto f-string
  {
    "chrisgrieser/nvim-puppeteer",
    event = "BufReadPre",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
}

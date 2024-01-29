return {
  -- multi-select, keymap: ctrl-n
  { "mg979/vim-visual-multi", event = "BufReadPre" },

  -- color brackets
  {
    "HiPhish/nvim-ts-rainbow2",
    event = "BufReadPre",
  },

  -- show color on Hex color code
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
  {
    "echasnovski/mini.bufremove",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<leader>bD", false },
      {
        ";c",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete Buffer",
      },
    },
  },
}

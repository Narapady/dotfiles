return {
  {
    "craftzdog/solarized-osaka.nvim",
    priority = 1000,
    lazy = true,
    opts = function()
      return {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
          comments = { italic = true },
          keywords = { italic = true },
          functions = { italic = true },
        },
      }
    end,
  },
}

-- for displaying diagnostics in the statusline
local function get_diagnostic_label(props)
  local icons = {
    Error = " ",
    Warn = " ",
    Info = " ",
    Hint = " ",
  }

  local label = {}
  for severity, icon in pairs(icons) do
    local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
    if n > 0 then
      local fg = "#"
        .. string.format("%06x", vim.api.nvim_get_hl_by_name("DiagnosticSign" .. severity, true)["foreground"])
      table.insert(label, { icon .. " " .. n .. " ", guifg = fg })
    end
  end
  return label
end

-- for displaying git sign
local function get_git_diff(props)
  local icons = { removed = "󱍪 ", changed = " ", added = "󱍭 " }
  local labels = {}
  local signs = vim.api.nvim_buf_get_var(props.buf, "gitsigns_status_dict")
  -- local signs = vim.b.gitsigns_status_dict
  for name, icon in pairs(icons) do
    if tonumber(signs[name]) and signs[name] > 0 then
      table.insert(labels, { icon .. " " .. signs[name] .. " ", group = "Diff" .. name })
    end
  end
  if #labels > 0 then
    table.insert(labels, { "| " })
  end
  return labels
end

return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  priority = 1200,
  config = function()
    require("incline").setup({
      debounce_threshold = { falling = 500, rising = 250 },
      render = function(props)
        local bufname = vim.api.nvim_buf_get_name(props.buf)
        local filename = vim.fn.fnamemodify(bufname, ":t")
        if vim.bo[props.buf].modified then
          filename = " " .. filename
        end
        local diagnostics = get_diagnostic_label(props)
        local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold" or "None"
        local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)

        local buffer = {
          { get_git_diff(props) },
          { filetype_icon, guifg = color },
          { " " },
          { filename, gui = modified },
        }

        if #diagnostics > 0 then
          table.insert(diagnostics, { "| ", guifg = "grey" })
        end
        for _, buffer_ in ipairs(buffer) do
          table.insert(diagnostics, buffer_)
        end
        return diagnostics
      end,
    })
  end,
}

return {
  "Yggdroot/indentLine",
  config = function()
    vim.g.indentLine_enabled = 1
    vim.g.indentLine_char = '┊'
    vim.opt.list = true
    vim.opt.listchars:append({
      tab = "¦ ",
      -- trail = "·",
      -- eol = "↴",
    })
  end
}

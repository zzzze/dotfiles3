return {
  "Yggdroot/indentLine",
  config = function()
    vim.g.indentLine_enabled = 1
    vim.g.indentLine_fileTypeExclude = { "neo-tree" }
    vim.g.indentLine_conceallevel = 2
    vim.g.vim_json_conceal = 0
    vim.g.markdown_syntax_conceal = 0
    vim.g.indentLine_char = '┊'
    vim.g.indentLine_leadingSpaceEnabled = 1
    vim.g.indentLine_leadingSpaceChar = ' '
    vim.opt.list = true
    vim.opt.listchars:append({
      tab = "¦ ",
      space = "·",
      -- trail = "·",
      -- eol = "↴",
    })
  end
}

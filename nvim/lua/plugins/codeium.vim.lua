return {
  "Exafunction/codeium.vim",
  branch = "main",
  config = function()
    vim.g.codeium_enabled = true
    vim.g.codeium_disable_bindings = 1

    vim.keymap.set('i', '<C-]>', 'codeium#Clear()', { expr = true, silent = true })
    vim.keymap.set('i', '<C-l>', 'codeium#Accept()', { expr = true, silent = true })
    vim.keymap.set('i', '<C-j>', 'codeium#AcceptNextWord()', { expr = true, silent = true })
    vim.keymap.set('i', '<C-k>', 'codeium#AcceptNextLine()', { expr = true, silent = true })
    vim.keymap.set('i', '<M-]>', 'codeium#CycleCompletions(1)', { expr = true, silent = true })
    vim.keymap.set('i', '<M-[>', 'codeium#CycleCompletions(-1)', { expr = true, silent = true })
  end,
}

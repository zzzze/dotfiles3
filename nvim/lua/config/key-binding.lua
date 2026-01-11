vim.keymap.set('n', '<Leader>z', ':tabnew %<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'R', ':source $MYVIMRC<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-t>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-y>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })

-- Toggle between light and dark theme
vim.keymap.set('n', '<Leader>t', function()
  local current = vim.g.colors_name
  if current == 'github_dark' or current == 'github_dark_default' then
    vim.cmd('colorscheme github_light')
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#dddddd" })
    vim.g.airline_theme = 'sol'
    -- vim.g.airline_solarized_bg = 'light'
  else
    vim.cmd('colorscheme github_dark')
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#555555" })
    vim.g.airline_theme = 'deus'
  end
  vim.cmd('AirlineRefresh')
  vim.cmd('AirlineRefresh')
end, { noremap = true, silent = true, desc = "Toggle light/dark theme" })

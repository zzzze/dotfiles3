vim.keymap.set('n', '<Leader>z', ':tabnew %<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'R', ':source $MYVIMRC<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-t>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-y>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })

-- Check if running in Ghostty terminal
local function is_ghostty()
  if vim.fn.exists('$GHOSTTY_RESOURCES_DIR') == 1 then
    return true
  end

  if vim.fn.exists('$TMUX') == 1 then
    local result = vim.fn.system('tmux show-environment -g TERM_PROGRAM 2>/dev/null')
    if result:match('ghostty') then
      return true
    end
  end

  return false
end

-- Update Ghostty theme
local function update_ghostty_theme(theme)
  local ghostty_config = os.getenv('HOME') .. '/.config/ghostty/config'
  local real_path = vim.fn.resolve(ghostty_config)

  local lines = vim.fn.readfile(real_path)
  for i, line in ipairs(lines) do
    if line:match('^theme = ') then
      lines[i] = 'theme = ' .. theme
      break
    end
  end

  vim.fn.writefile(lines, real_path)
end

-- Toggle between light and dark theme
vim.keymap.set('n', '<Leader>t', function()
  local current = vim.g.colors_name
  if current == 'github_dark' or current == 'github_dark_default' then
    vim.cmd('colorscheme github_light')
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#dddddd" })
    vim.g.airline_theme = 'sol'

    if is_ghostty() then
      update_ghostty_theme('Rose Pine Dawn')
    end
  else
    vim.cmd('colorscheme github_dark')
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#555555" })
    vim.g.airline_theme = 'deus'

    if is_ghostty() then
      update_ghostty_theme('Atom One Dark')
    end
  end
  vim.cmd('AirlineRefresh')
  vim.cmd('AirlineRefresh')
end, { noremap = true, silent = true, desc = "Toggle light/dark theme" })

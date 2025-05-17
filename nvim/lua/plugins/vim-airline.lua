return {
  { "vim-airline/vim-airline-themes" },
  {
    "vim-airline/vim-airline",
    dependencies = {
      "tomasiser/vim-code-dark",
    },
    config = function()
      -- theme
      vim.g.airline_theme='codedark'
      vim.g.airline_powerline_fonts = 1

      vim.g['airline#extensions#whitespace#mixed_indent_algo'] = 1

      if not vim.g.airline_symbols then
        vim.g.airline_symbols = {}
      end

      -- unicode symbols
      vim.g.airline_left_sep = '»'
      vim.g.airline_left_sep = '▶'
      vim.g.airline_right_sep = '«'
      vim.g.airline_right_sep = '◀'
      vim.g.airline_symbols.crypt = '🔒'
      vim.g.airline_symbols.linenr = '☰'
      vim.g.airline_symbols.linenr = '␊'
      vim.g.airline_symbols.linenr = '␤'
      vim.g.airline_symbols.linenr = '¶'
      vim.g.airline_symbols.maxlinenr = ''
      vim.g.airline_symbols.maxlinenr = '㏑'
      vim.g.airline_symbols.branch = '⎇'
      vim.g.airline_symbols.paste = 'ρ'
      vim.g.airline_symbols.paste = 'Þ'
      vim.g.airline_symbols.paste = '∥'
      vim.g.airline_symbols.spell = 'Ꞩ'
      vim.g.airline_symbols.notexists = 'Ɇ'
      vim.g.airline_symbols.whitespace = 'Ξ'

      -- powerline symbols
      vim.g.airline_left_sep = ''
      vim.g.airline_left_alt_sep = ''
      vim.g.airline_right_sep = ''
      vim.g.airline_right_alt_sep = ''
      vim.g.airline_symbols.branch = ''
      vim.g.airline_symbols.readonly = ''
      vim.g.airline_symbols.linenr = '☰'
      vim.g.airline_symbols.maxlinenr = ''

      vim.g['airline#extensions#tabline#enabled'] = 1
      vim.g['airline#extensions#tabline#left_sep'] = ''
      vim.g['airline#extensions#tabline#left_alt_sep'] = ''
      vim.g['airline#extensions#tabline#formatter'] = 'default'
      vim.g['airline#extensions#tabline#buffer_nr_show'] = 1
      vim.g['airline#extensions#tabline#show_splits'] = 0
      vim.g['airline#extensions#tabline#show_buffers'] = 0
      vim.g['airline#extensions#branch#enabled'] = 0
      vim.g['airline#extensions#branch#use_vcscommand'] = 1
      vim.g['airline#extensions#branch#vcs_priority'] = { "git" }
      vim.g['airline#extensions#tagbar#enabled'] = 1

      -- linenr
      local function format_number(num)
        local str = tostring(num)
        local result = str:reverse():gsub("(%d%d%d)", "%1,"):reverse()
        if result:sub(1, 1) == ',' then
          result = result:sub(2)
        end
        return result
      end
      function _G.MyLineNumber()
        local current_line = vim.fn.line('.')
        local total_lines = vim.fn.line('$')
        return format_number(current_line) .. " | " .. format_number(total_lines)
      end
      vim.cmd([[
        call airline#parts#define('linenr', {
        \ 'function': 'v:lua.MyLineNumber',
        \ 'accents': 'bold'
        \ })
      ]])
      vim.g.airline_section_z = vim.fn['airline#section#create']({
        '%3p%%: ',
        'linenr',
        ':%3v'
      })
    end,
  },
}

return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "neoclide/coc-tsserver",
    },
    keys = {
      { "gd", ":Telescope coc definitions<CR>", "n", desc="Definitions" },
      { "gy", ":Telescope coc type_definitions<CR>", "n", desc="Type Definitions" },
      { "gi", ":Telescope coc implementations<CR>", "n", desc="Implementations" },
      { "gr", ":Telescope coc references<CR>", "n", desc="References" },
    },
    config = function()
      local function show_documentation()
        local filetype = vim.bo.filetype
        if filetype == 'vim' or filetype == 'help' then
          vim.cmd('h ' .. vim.fn.expand('<cword>'))
        else
          vim.fn.CocAction('doHover')
        end
      end

      vim.api.nvim_set_keymap('n', 'K', '', {
        noremap = true,
        silent = true,
        callback = show_documentation
      })

      -- Use <CR> to confirm completion
      vim.keymap.set('i', '<CR>', function()
        return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#_select_confirm']() or '<C-g>u<CR>'
      end, {expr = true, silent = true})

      -- Use <Tab> to confirm completion
      vim.keymap.set('i', '<Tab>', function()
        return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#_select_confirm']() or '<Tab>'
      end, {noremap = true, expr = true, silent = true})

    end,
  },
  { "neoclide/coc-tsserver", build = "yarn install --frozen-lockfile" },
}

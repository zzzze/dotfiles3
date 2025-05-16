return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    lazy = false,
    dependencies = { 'nvim-telescope/telescope.nvim' },
    keys = {
      -- { "K", ":call <SID>show_documentation()<CR>", "nnore", desc="Show Documentation" },
      { "gd", ":Telescope coc definitions<CR>", "n", desc="Definitions" },
      { "gy", ":Telescope coc type_definitions<CR>", "n", desc="Type Definitions" },
      { "gi", ":Telescope coc implementations<CR>", "n", desc="Implementations" },
      { "gr", ":Telescope coc references<CR>", "n", desc="References" },
      -- { "<leader>f", "<cmd>Telescope live_grep<cr>", "nnore" },
      -- { "<leader>b", "<cmd>Telescope buffers<cr>", "nnore", desc="Find: Files in Buffers" },
      -- { "<leader>t", "<cmd>Telescope help_tags<cr>", "nnore" },
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

      vim.keymap.set("i", "<CR>", function()
        if vim.fn.pumvisible() == 1 then
          return vim.fn["coc#_select_confirm"]()
        else
          return vim.api.nvim_replace_termcodes("<C-g>u<CR><C-r>=coc#on_enter()<CR>", true, true, true)
        end
      end, { expr = true, silent = true })
    end,
  },
}

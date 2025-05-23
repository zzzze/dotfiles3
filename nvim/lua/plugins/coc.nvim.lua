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
      -- Use K to show documentation in preview window
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

      -- Remap for rename current word
      vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", { desc = "Rename symbol (Coc)" })

      -- Use `[g` and `]g` to navigate diagnostics
      vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {
        silent = true,
        desc = "Go to previous diagnostic",
      })
      vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {
        silent = true,
        desc = "Go to next diagnostic",
      })

      -- Highlight symbol under cursor on CursorHold
      vim.api.nvim_create_autocmd("CursorHold", {
        pattern = "*",
        callback = function()
          vim.fn.CocActionAsync("highlight")
        end,
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
  { "neoclide/coc-pairs", build = "yarn install --frozen-lockfile" },
  { "neoclide/coc-emmet", build = "yarn install --frozen-lockfile" },
  { "neoclide/coc-css", build = "yarn install --frozen-lockfile" },
  { "fannheyward/coc-rust-analyzer", build = "yarn install --frozen-lockfile" },
  { "xiyaowong/coc-sumneko-lua", build = "yarn install --frozen-lockfile" },
}

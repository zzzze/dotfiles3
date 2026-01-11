return {
  {
    "tomasiser/vim-code-dark",
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme('codedark')
    -- end,
  },
  {
    "rose-pine/neovim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('rose-pine')
      vim.o.background = 'light'
    end,
  }
}

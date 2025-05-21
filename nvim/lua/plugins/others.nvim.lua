return {
  { "folke/which-key.nvim" },
  {
    "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      opts = {
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "markdown_inline",
        }
      },
  },
  { "tomtom/tcomment_vim" },
  { "christoomey/vim-tmux-navigator" },
}

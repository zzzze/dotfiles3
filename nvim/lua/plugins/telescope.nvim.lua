return {
  "nvim-telescope/telescope.nvim",
  branch = '0.1.x',
  dependencies = {
    -- 'nvim-lua/plenary.nvim',
    'fannheyward/telescope-coc.nvim'
  },
  keys = {
    { "<C-p>", ":Telescope find_files<cr>", "n", desc="Find: Files" },
    { "<leader>f", "<cmd>Telescope live_grep<cr>", "nnore" },
    { "<leader>b", "<cmd>Telescope buffers<cr>", "nnore", desc="Find: Files in Buffers" },
    { "<leader>t", "<cmd>Telescope help_tags<cr>", "nnore" },
  },
  config = function ()
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")
    local telescope = require('telescope')
    telescope.load_extension('coc')
    telescope.setup{
      defaults = {
        mappings = {
          n = {
            ["<C-x>"] = action_layout.toggle_preview,
          },
          i = {
            ["<C-u>"] = false,
            ["<C-x>"] = action_layout.toggle_preview,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-Down>"] = actions.cycle_history_next,
            ["<C-Up>"] = actions.cycle_history_prev,
            ["<C-S-n>"] = function(bufnr)
              require("telescope.state").get_status(bufnr).picker.layout_config.scroll_speed = 1
              return require("telescope.actions").preview_scrolling_down(bufnr)
            end,
            ["<C-S-p>"] = function(bufnr)
              require("telescope.state").get_status(bufnr).picker.layout_config.scroll_speed = 1
              return require("telescope.actions").preview_scrolling_up(bufnr)
            end
          },
        },
      },
    }
  end,
}

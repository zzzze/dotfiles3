local function setup()
  if #vim.fn.argv() == 0 then
    vim.cmd("Neotree toggle")
  end
  -- vim.cmd("TmuxNavigateRight")
  -- vim.cmd("Dashboard")
end

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    if #vim.fn.argv() == 0 then
      setup()
    end
  end
})

local M = {}
M.check = function()
  vim.health.start("freeze.nvim report")

  if vim.fn.executable("freeze") == 1 then
    vim.health.ok("freeze command is installed")
  else
    vim.health.error("freeze command is not installed")
  end
end
return M

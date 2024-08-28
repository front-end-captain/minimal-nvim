local M = {}
local spec = {
  "lukas-reineke/indent-blankline.nvim",
  lazy = true,
  main = "ibl",
  config = function()
    require("ibl").setup({})
  end,
}
table.insert(M, spec)
return M

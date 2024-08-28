local M = {}
local spec = {
  "kylechui/nvim-surround",
  lazy = true,
  config = function()
    require("nvim-surround").setup({})
  end,
}
table.insert(M, spec)
return M

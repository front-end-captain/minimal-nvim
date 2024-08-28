local M = {}
local spec = {
  "norcalli/nvim-colorizer.lua",
  lazy = true,
  config = function()
    require("colorizer").setup({})
  end,
}
table.insert(M, spec)
return M

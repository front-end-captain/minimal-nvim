local M = {}

local spec = {
  "numToStr/Comment.nvim",
  lazy = true,
  config = function()
    require("Comment").setup({
      padding = true,
      sticky = true,
      ignore = nil,
      toggler = {
        line = "cc",
        block = "gbc",
      },
      opleader = {
        line = "gc",
        block = "gb",
      },
      extra = {
        above = "gcO",
        below = "gco",
        eol = "gcA",
      },
      mappings = {
        basic = true,
        extra = true,
        extended = false,
      },
      pre_hook = nil,
      post_hook = nil,
    })
  end,
}

table.insert(M, spec)

return M

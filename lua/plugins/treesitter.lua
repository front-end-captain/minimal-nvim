local M = {}

local spec = {
  "nvim-treesitter/nvim-treesitter",
  event = "BufEnter",
  -- dependencies = {
  --   "nvim-treesitter/nvim-treesitter-textobjects"
  -- },
  main = "nvim-treesitter.configs",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "html",
      "css",
      "vim",
      "lua",
      "javascript",
      "typescript",
      "tsx",
      "rust",
      "markdown",
      "markdown_inline",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    -- textobjects = {
    --   select = {
    --     enable = true,
    --     lookahead = true,
    --     keymaps = {
    --       ["af"] = "@function.outer",
    --       ["if"] = "@function.inner",
    --       ["ac"] = "@class.outer",
    --       ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
    --       ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
    --     },
    --     selection_modes = {
    --       ["@parameter.outer"] = "v", -- charwise
    --       ["@function.outer"] = "V", -- linewise
    --       ["@class.outer"] = "<c-v>", -- blockwise
    --     },
    --     include_surrounding_whitespace = false,
    --   },
    -- },
  },
}

table.insert(M, spec)

return M

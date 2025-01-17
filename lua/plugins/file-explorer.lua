local M = {}

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

function FindKeywordInCurrentFolder()
  local api = require("nvim-tree.api")
  local utils = require("nvim-tree.utils")
  -- TODO: should catch expection while call it
  local node = api.tree.get_node_under_cursor()

  if node.type == "directory" then
    local lga = require("telescope").extensions.live_grep_args
    local relative = utils.path_relative(node.absolute_path, vim.fn.getcwd())
    local default_text = vim.fn.getreg()

    lga.live_grep_args({
      results_title = relative .. "/",
      cwd = node.absolute_path,
      default_text = default_text or "",
    })
  end
end

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts("Toggle"))
  vim.api.nvim_set_keymap("n", "<leader>d", ":NvimTreeOpen<CR>", opts("Focus"))
  -- vim.api.nvim_set_keymap("n", "<leader>d", ":NvimTreeFocus<CR>", opts("Focus"))
  vim.api.nvim_set_keymap("n", "<leader>H", ":NvimTreeResize +10<CR>", opts("+Size"))
  vim.api.nvim_set_keymap("n", "<leader>L", ":NvimTreeResize -10<CR>", opts("-Size"))
  vim.api.nvim_set_keymap("n", "<leader>G", ":lua FindKeywordInCurrentFolder()<CR>", opts("-Size"))
end

local spec = {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = true,
  config = function()
    require("nvim-tree").setup({
      on_attach = on_attach,
      git = {
        enable = true,
        ignore = false,
      },
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      -- which dir will hide
      filters = {
        dotfiles = false,
        custom = { ".idea" },
      },
      view = {
        width = 50,
        side = "right",
        number = true,
        relativenumber = true,
        signcolumn = "yes",
      },
      notify = {
        threshold = vim.log.levels.ERROR,
        absolute_path = true,
      },
    })
  end,
}
table.insert(M, spec)

return M

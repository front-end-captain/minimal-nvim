local M = {}

local spec = {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        initial_mode = "insert",
        mappings = {
          i = {
            ["<C-n>"] = "move_selection_next",
            ["<C-p>"] = "move_selection_previous",
            ["<Down>"] = "move_selection_next",
            ["<Up>"] = "move_selection_previous",
            ["<C-N>"] = "cycle_history_next",
            ["<C-P>"] = "cycle_history_prev",
            ["<C-u>"] = "preview_scrolling_up",
            ["<C-d>"] = "preview_scrolling_down",
          },
        },
      },
      pickers = {
        live_grep = {
          theme = "dropdown",
          -- "horizontal" | "center" | "cursor" | "vertical" | "flex" | "bottom_pane"
          layout_strategy = "vertical",
          layout_config = {
            prompt_position = "top",
            width = function(_, max_columns, _)
              return math.max(max_columns - 80, 80)
            end,
            height = function(_, _, max_lines)
              return max_lines - 2
            end,
          },
        },
      },
    })
  end,
}

table.insert(M, spec)
-- find file
vim.api.nvim_set_keymap(
  "n",
  "<C-f>",
  ":Telescope find_files<CR>",
  { noremap = true, silent = true }
)
-- global search
vim.api.nvim_set_keymap("n", "<C-g>", ":Telescope live_grep<CR>", { noremap = true, silent = true })
return M

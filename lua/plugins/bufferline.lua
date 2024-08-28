local M = {}

-- Hint = "", "➤"

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
map("n", "<leader>k", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader>j", ":BufferLineCycleNext<CR>", opt)
map("n", "<leader>q", ":bdelete!<CR>", opt)
-- map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
-- map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
-- map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

local spec = {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "VimEnter",
  config = function()
    require("bufferline").setup({
      options = {
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
        -- 'slant' | 'padded_slant' | 'thick' | 'thin' | 'slope' | 'padded_slope'
        separator_style = "thin",
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
      },
      highlights = {
        buffer_selected = {
          bold = true,
          italic = true,
        },
        warning_selected = {
          fg = "NONE",
          bg = "NONE",
          sp = "NONE",
          bold = true,
          italic = true,
        },
        error_selected = {
          fg = "NONE",
          bg = "NONE",
          sp = "NONE",
          bold = true,
          italic = true,
        },
      },
    })
  end,
}
table.insert(M, spec)

return M

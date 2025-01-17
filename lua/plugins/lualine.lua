local M = {}
local spec = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = true,
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        component_separators = { left = "|", right = "|" },
        -- https://github.com/ryanoasis/powerline-extra-symbols
        section_separators = { left = " ", right = "" },
      },
      extensions = { "nvim-tree", "toggleterm" },
      sections = {
        lualine_c = {
          "location",
          {
            "filename",
            file_status = true,
            path = 1,
          },
          -- { navic.get_location, cond = navic.is_available },
        },
        lualine_x = {
          "filesize",
          {
            "fileformat",
            -- symbols = {
            --   unix = '', -- e712
            --   dos = '', -- e70f
            --   mac = '', -- e711
            -- },
            symbols = {
              unix = "LF",
              dos = "CRLF",
              mac = "CR",
            },
          },
          "encoding",
          "filetype",
        },
      },
    })
  end,
}
table.insert(M, spec)

return M

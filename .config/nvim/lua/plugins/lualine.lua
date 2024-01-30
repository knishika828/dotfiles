return {
  "nvim-lualine/lualine.nvim",
  event = {"VeryLazy"},
  config = function()
    require("lualine").setup {
      options = {
        icons_enabled = false,
        theme = "tokyonight",
        -- コンポーネントセパレーターとセクションセパレーターを消す
        component_separators = {},
        section_separators = {},
        -- 指定したFileTypeのstatuslineとwinbarを指定する
        -- 下記の場合SidebarNvimの場合は非表示とする
        disabled_filetypes = {
          "NvimTree",
          "SidebarNvim",
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch"},
        lualine_c = {
          "filename",
          {
            'diff',
            symbols = {added = ' ', modified = ' ', removed = ' '},
          },
          "'%='",
          {
            'diagnostics',
            symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
          }
        },
        lualine_x = {"filetype"},
        lualine_y = {"encoding"},
        lualine_z = {"location"}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
}

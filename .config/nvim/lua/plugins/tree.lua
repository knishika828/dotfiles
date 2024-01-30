return {
  "nvim-tree/nvim-tree.lua",
  event = {"VeryLazy"},
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        -- 表示幅
        width = "15%",
        -- 表示位置
        side = "right",
        -- ファイル左側に数字を表示しない
        relativenumber = false,
        signcolumn = "yes",
      },
      renderer = {
        -- NerdTree上にインデントを表示する
        indent_markers = {
          enable = true,
        },
        -- 変更があったファイルをハイライトする
        highlight_git = true,
        -- バッファでファイル名をハイライトする
        highlight_opened_files = "name",
        -- ファイル毎にgitのステータス状況をマークで示す
        icons = {
          glyphs = {
            git = {
              unstaged = "!",
              renamed = "»",
              untracked = "?",
              deleted = "✘",
              staged = "✓",
              unmerged = "",
              ignored = "◌",
            },
          },
        },
      },
      actions = {
        -- E入力した際の挙動設定, .git, target, buildフォルダを覗いたフォルダを100まで展開する
        expand_all = {
          max_folder_discovery = 100,
          exclude = { ".git", "target", "build" },
        },
      },
      filters = {
        -- .gitignore対象も表示する
        git_ignored = false,
        -- 表示したくないフォルダやファイルを正規表現で指定する
        custom = {
          "^.git$",
        }
      },
      on_attach = "default"
    })

    -- NerdTreをデフォルトで表示させる
    local function open_nvim_tree()
      require("nvim-tree.api").tree.open()
      vim.cmd('wincmd p')
    end
    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

    -- 開いていたウィンドウが一つだった場合、NerdTreeを閉じてからウィンドウを閉じる
    vim.api.nvim_create_autocmd("BufEnter", {
      group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
      pattern = "NvimTree_*",
      callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
      end
    })

    -- Ctrl-nでNvimTreeの表示を切り替える
    vim.keymap.set("n", "<C-n>", "<Cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer" })
  end,
}

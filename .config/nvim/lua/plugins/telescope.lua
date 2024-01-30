-- fd-find, ripgrepが必要
return {
  "nvim-telescope/telescope.nvim",
  event = {"VeryLazy"},
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make"
    },
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    require("telescope").setup{
      defaults = {
        layout_config = {
          width = 0.95,
          height = 0.95,
        },
        -- 検索除外対象
        file_ignore_patterns = {
          "^.git/",
          "node_modules/",
          ".cache/",
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "-uu",
        },
      },
      extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        file_browser = {
          hijack_netrw = true,
          hidden = true,
        },
     },
    }
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("file_browser")

    -- キーバインド
    local builtin = require("telescope.builtin")
    -- カレントディレクリからファイルを検索
    vim.keymap.set("n", "<Leader>f", "<Cmd>Telescope find_files hidden=true<CR>", { silent = true, noremap = true })
    -- カレントディレクトリを対象に全文検索
    -- vim.keymap.set("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>", { silent = true, noremap = true })
    -- 開いているバッファを検索
    -- vim.keymap.set("n", "<leader>fb", "<Cmd>Telescope buffers<CR>", { silent = true, noremap = true })
    -- ファイル名検索
    -- vim.keymap.set("n", "<leader>fd", "<Cmd>:Telescope file_browser<CR>", { silent = true, noremap = true })
    -- gitで管理しているファイルを検索
    -- vim.keymap.set("n", "<leader>gf", "<Cmd>:Telescope git_files<CR>", {silent = true, noremap = true })
    -- git statusでヒットしたファイルを検索
    vim.keymap.set("n", "<leader>gs", "<Cmd>:Telescope git_status<CR>", {silent = true, noremap = true })
  end
}


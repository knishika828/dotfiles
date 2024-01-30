return {
  "lewis6991/gitsigns.nvim",
  event = {"VeryLazy"},
  config = function()
    require("gitsigns").setup {
      signs = {
        add =          { hl = "GitSignsAdd",    text = " ▎", numhl = "GitSignsAddNr",    linehl = "GitSignsAddLn"    },
        change =       { hl = "GitSignsChange", text = " ▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete =       { hl = "GitSignsDelete", text = " ", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete =    { hl = "GitSignsDelete", text = " ", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = " ▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      },
      signcolumn = true,
      numhl      = true,
      word_diff  = false,
      watch_gitdir = {
        follow_files = true,
      },
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 500,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1
      },
      yadm = {
        enable = false
      }
    }
  end
}

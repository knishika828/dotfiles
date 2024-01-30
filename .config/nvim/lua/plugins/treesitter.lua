return {
  "nvim-treesitter/nvim-treesitter",
  event = {"VeryLazy"},
  dependencies = {
    "HiPhish/nvim-ts-rainbow2",
    "windwp/nvim-ts-autotag"
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      rainbow = {
        enable = true,
        query = "rainbow-parens",
        strategy = require("ts-rainbow").strategy.global,
      },
      autotag = {
        enable = true
      },
      -- treesitterの構文解析追加はここに記載すること
      ensure_installed = {
        "bash",
        "lua",
        "luadoc",
        "java",
        "javascript",
        "typescript",
        "python",
        "go",
        "rust",
        "scss",
        "css",
        "html",
        "json",
        "yaml",
        "toml",
        "vim",
        "vimdoc"
      },
      sync_install = false,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true
      },
    })
  end
}

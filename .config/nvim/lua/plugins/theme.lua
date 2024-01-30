return {
  "folke/tokyonight.nvim",
  priority = 1000,
  event = {"VimEnter"},
  config = function()
    require("tokyonight").setup({
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats   = "transparent",
    },
  })
  -- Themeを有効化
  vim.cmd.colorscheme "tokyonight-night"
  end
}

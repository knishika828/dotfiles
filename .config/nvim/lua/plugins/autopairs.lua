return {
  'windwp/nvim-autopairs',
  event = {"BufNewFile", "BufReadPost"},
  opts = {},
  config = function()
    require("nvim-autopairs").setup({})
  end
}

return {
  "FotiadisM/tabset.nvim",
  event = {"BufEnter"},
  config = function()
    require("tabset").setup({
      defaults = {
        tabwidth = 2,
        expandtab = true,
      },
      languages = {
        go = {
          tabwidth = 4,
          expandtab = true
        },
        python = {
          tabwidth = 4,
          expandtab = true
        },
        java = {
          tabwidth = 4,
          expandtab = true
        }
      }
    })
  end
}

return {
  "sidebar-nvim/sidebar.nvim",
  config = function()
    require("sidebar-nvim").setup({
      disable_default_keybindings = 0,
      bindings = nil,
      open = false,
      side = "left",
      initial_width = 35,
      hide_statusline = true,
      update_interval = 1000,
      sections = { "git", "diagnostics" },
      section_separator = {"", "-----", ""},
      section_title_separator = {""},
    })
  end
}

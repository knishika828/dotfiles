return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()
    require("bufferline").setup({
      options = {
        separator_style = "slope",
        buffer_close_icon = "",
        modified_icon = "",
        indicator = {
          icon = "",
          style = "icon",
        },
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = true,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = ""
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and "  "
              or (e == "warning" and "  " or "  " or "  " )
            s = s .. sym .. n
          end
          return s
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true
          }
        },
        -- custom_areas = {
        --   right = function()
        --       local result = {}
        --       local seve = vim.diagnostic.severity
        --       local error = #vim.diagnostic.get(0, {severity = seve.ERROR})
        --       local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
        --       local info = #vim.diagnostic.get(0, {severity = seve.INFO})
        --       local hint = #vim.diagnostic.get(0, {severity = seve.HINT})
        --
        --       if error ~= 0 then
        --           table.insert(result, {text = " " .. error, fg = "#EC5241"})
        --       end
        --
        --       if warning ~= 0 then
        --           table.insert(result, {text = " " .. warning, fg = "#EFB839"})
        --       end
        --
        --       if hint ~= 0 then
        --           table.insert(result, {text = " " .. hint, fg = "#A3BA5E"})
        --       end
        --
        --       if info ~= 0 then
        --           table.insert(result, {text = " " .. info, fg = "#7EA9A7"})
        --       end
        --       return result
        --   end,
        -- }
      }
    })

    vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<Cr>", { silent = true, noremap = true })
    vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<Cr>", { silent = true, noremap = true })

  end
}

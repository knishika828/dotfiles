-- TODO: キーバインド周りがまだ未設定
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "onsails/lspkind.nvim",
    "jay-babu/mason-null-ls.nvim",
    "nvimtools/none-ls.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local mason_null_ls = require("mason-null-ls")
    local null_ls = require("null-ls")

    -- 補完
    cmp.setup({
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
          before = function(entry, vim_item)
            return vim_item
          end,
        }),
      },
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        --["<C-b>"] = cmp.mapping.scroll_docs(-4),
        --["<C-f>"] = cmp.mapping.scroll_docs(4),
        --["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "vsnip" },
        { name = "path" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "cmdline" },
      }),
    })

    -- Mason のセットアップ
    mason.setup()

    -- インストールする LSP サーバーのリスト
    local servers_to_install = {
      "lua_ls", -- lua
      "pyright",
    }
    mason_lspconfig.setup({
      ensure_installed = servers_to_install,
    })

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = cmp_nvim_lsp.default_capabilities(),
        })
      end,
    })

    -- 共通の LSP セットアップ設定を使用
    lspconfig.lua_ls.setup({})
    lspconfig.pyright.setup({})

    -- Formatter, Linter
    mason_null_ls.setup({
      ensure_installed = {
        -- python
        "black",
        "isort",
      },
      automatic_installation = false,
      handlers = {},
    })

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
      }
    })

    vim.keymap.set('n', '<leader>p', function() vim.lsp.buf.format { async = true } end )
  end,
}

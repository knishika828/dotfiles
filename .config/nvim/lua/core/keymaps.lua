-- <leader>をスペースに割り当てる
vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- 便利系 
keymap.set('i', 'jj', '<Esc>', opts)
keymap.set('n', '<leader>q', '<Cmd>:q<CR>', opts)

-- インクリメント/デクリメント
keymap.set('n', '+', "<C-a>")
keymap.set('n', '-', "<C-x>")

-- 全体を選択
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Window関連
keymap.set('n', '<C-h>', '<C-w>h', opts)
keymap.set('n', '<C-j>', '<C-w>j', opts)
keymap.set('n', '<C-k>', '<C-w>k', opts)
keymap.set('n', '<C-l>', '<C-w>l', opts)
keymap.set('n', '<C-q>', '<C-w>q', opts)
keymap.set('n', 'ss', '<C-w>s', opts)
keymap.set('n', 'sv', '<C-w>v', opts)

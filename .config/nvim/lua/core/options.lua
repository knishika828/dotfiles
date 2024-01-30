-- エンコード関係
local encoding      = "utf-8"
vim.o.encoding      = encoding -- vim内部文字コードをutf-8に設定
vim.o.fileencoding  = encoding -- ファイル書き込み時の文字コードをutf-8に設定
vim.o.fileencodings = encoding -- ファイル読み込み時の文字コードをutf-8に設定

-- タブ関連
local indent      = 2
vim.o.expandtab   = true   -- 入力したタブをスペースに変換する
vim.o.autoindent  = true   -- 改行時に前行と同じ数文インデントを挿入する
vim.o.smarttab    = true   -- 行の先頭でtab入力したときにインデントを挿入
vim.o.softtabstop = indent -- タブを空白何個分に置き換えるか
vim.o.tabstop     = indent -- ファイル内のタブを空白何個分に置き換えるか
vim.o.shiftwidth  = indent -- 行頭に挿入するインデントの数

-- ファイル関連
vim.o.autoread    = true  -- 編集中のファイルが他で変更されたら再読込する
vim.o.backup      = false -- バックアップファイルを作成しない
vim.o.writebackup = false -- ファイル上書き前にバック不アップを作成しない
vim.o.swapfile    = false -- スワップファイルを作成しない
vim.o.undofile    = false -- アンドゥ履歴を保持しない

-- 検索関連
vim.o.ignorecase   = true -- 大文字・小文字を区別しないで検索
vim.o.smartcase    = true -- 検索時に大文字を含む場合大文字・小文字を区別して検索
vim.o.wrapscan     = true -- ファイル末尾まで検索したら先頭に戻る
vim.o.incsearch    = true -- 検索する際にエンター押す前に対象の文字列にカーソルを合わせる
vim.o.hlsearch     = true -- ハイライト検索を有効化
vim.opt.matchtime = 1 -- 入力された文字列がマッチするまでにかかる時間

-- 表示関連
vim.wo.number       = true     -- 行番号を表示
vim.wo.cursorline   = true     -- 操作している行を強調
vim.wo.wrap         = false    -- 折り返さない
vim.wo.list         = true     -- 非可視文字を記号で表示する
vim.wo.listchars    = 'eol:↲'  -- 非可視文字の表示記号を指定する(eol: 改行)
vim.o.laststatus    = 1        -- ステータスラインを常に表示
vim.o.termguicolors = true     -- TrueColorでシンタックスハイライト
vim.wo.signcolumn   = 'yes'    -- sigh表示用の列を常に表示
vim.o.winblend      = 0        -- ウィンドウの不透明度
vim.o.pumblend      = 0        -- ポップアップメニューの不透明度

-- 補完
vim.o.complete = "."
vim.o.complete = vim.o.complete .. ",w,b,u,t,i"
vim.o.completeopt = "menuone,noselect"

-- クリップボード連携
vim.o.clipboard = "unnamedplus"

-- 入力系
vim.o.updatetime = 250
vim.o.tileout    = true
vim.o.timeoutlen = 300

-- 不要なプラグイン読み込みを止める
vim.g.loaded_gzip              = 1
vim.g.loaded_tar               = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_zip               = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_vimball           = 1
vim.g.loaded_vimballPlugin     = 1
vim.g.loaded_getscript         = 1
vim.g.loaded_getscriptPlugin   = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_netrwSettings     = 1
vim.g.loaded_netrwFileHandlers = 1

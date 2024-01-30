# ヒストリーファイルの保存場所
export HISTFILE=${HOME}/.zsh_history

# メモリ内に保持する最大のヒストリーエントリ数
export HISTSIZE=100000

# ヒストリーファイルに保存する最大のヒストリーエントリ数
export SAVEHIST=100000

# すべてのセッションでヒストリーを共有
setopt share_history

# 重複するコマンドを無視
setopt hist_ignore_dups

# 連続する重複したコマンドを無視
setopt hist_ignore_all_dups

# スペースで始まるコマンドを無視
setopt hist_ignore_space

# 連続する空行を単一の空行に減らす
setopt hist_reduce_blanks

# ヒストリーファイルに重複したコマンドを保存しない
setopt hist_save_no_dups

# タイムスタンプとセッション情報を含めてコマンド履歴を保存
setopt extended_history

# ヒストリーファイルに追記する（上書きではなく）
setopt append_history

# ヒストリーファイルの読み込み時に検証
setopt hist_verify

# 表示時にヒストリーをレキシカルにソート
setopt hist_lex_words
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
### End of Zinit's installer chunk

# Add Plugins
zinit wait lucid blockf light-mode for \
    @'zsh-users/zsh-autosuggestions' \
    @'zsh-users/zsh-completions' \
    @'zdharma-continuum/fast-syntax-highlighting' \
    @'hlissner/zsh-autopair' \
    @'b4b4r07/enhancd' \
    @'wfxr/forgit'

# Prompt
if [ -e `which starship` ]; then
  eval "$(starship init zsh)"
fi

# FZF Settings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_TMUX_OPTS="-p 90%"
export FZF_DEFAULT_OPTS="--layout=reverse"
export FZF_DEFAULT_COMMAND="rg --files --hidden"
export FZF_CTRL_T_OPTS='--preview "bat --color=always --style=header,grid,numbers --line-range :100 {}"'
export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# Complement
FPATH="$HOME/.zsh/completions:${FPATH}"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit && compinit

# Path
typeset -U path PATH
export PATH=$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts(N-)

# History
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_no_store
setopt extended_history
setopt append_history
setopt hist_verify
setopt hist_lex_words

# Alias
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias vz='nvim ~/.zshrc'
alias soz='source ~/.zshrc'
alias zt='for i in {1..5}; do time zsh -ic exit; done'
alias ls='exa -l'
alias ll='exa -la --icons'
alias tree='exa -T'

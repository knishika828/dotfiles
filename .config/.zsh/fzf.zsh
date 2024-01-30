if [ -d "/usr/share/doc/fzf/examples/" ]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
else
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

export FZF_DEFAULT_OPTS='--layout=reverse --border --exit-0'

fzf-ghq() {
  local repo=$(ghq list | fzf --preview "ghq list --full-path --exact {} | xargs exa -h --long --icons --classify --git --no-permissions --no-user --no-filesize --git-ignore --sort modified --reverse --tree --level 5")
  if [ -n "$repo" ]; then
    repo=$(ghq list --full-path --exact $repo)
    BUFFER="cd ${repo}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fzf-ghq
bindkey '^]' fzf-ghq

# macのpbcopy, pbpasteを再現
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias ls='exa --classify --icons'
alias ll='exa -la --no-filesize --no-user --time-style=long-iso --icons'
alias ztime='time (zsh -i -c exit)'
alias soz='source ~/.zshrc'

# ubuntu環境だとbatはbatcatになっている
if uname -r | grep -q 'WSL'; then
  alias bat='batcat'
fi

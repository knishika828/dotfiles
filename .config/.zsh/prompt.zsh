if which starship >/dev/null 2>&1; then
  export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/starship.toml"
  eval "$(starship init zsh)"
fi

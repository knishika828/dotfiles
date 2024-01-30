# Check if ~/.local/bin/mise exists and is executable
if [ -e ~/.local/bin/mise ] && [ -x ~/.local/bin/mise ]; then
    eval "$(~/.local/bin/mise activate zsh)"
    export PATH="$HOME/.local/share/mise/shims:$PATH"
fi

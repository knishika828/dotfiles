#!/bin/bash

kernel_version=$(uname -r)
if echo "$kernel_version" | grep -q WSL2; then
    echo "Installing dotfiles for WSL2..."
    ## Git
    ln -sfn $PWD/.config/git ~/.config/
    echo "Created ~/.config/git"
    ## Starship
    ln -sfn $PWD/.config/starship ~/.config/
    echo "Created ~/.config/starship"
    ## Tmux
    ln -sfn $PWD/.config/tmux ~/.config/
    echo "Created ~/.config/tmux"
    ## Nvim
    ln -sfn $PWD/.config/nvim ~/.config/
    echo "Created ~/.config/nvim"
else
    echo "Unsupport"
    exit 1
fi
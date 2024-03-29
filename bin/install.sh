#!/bin/bash

if grep -qi Microsoft /proc/version; then
  # WSL
  echo "Installing dotfiles for WSL2..."
  ## Git
  ln -sfn $PWD/.config/git ~/.config/
  echo "Created ~/.config/git"
  ## Starship
  ln -sfn $PWD/.config/starship ~/.config/
  echo "Created ~/.config/starship"
  ## Tmux
  if [ ! -d "~/.config/tmux" ]; then
    mkdir -p "~/.config/tmux"
  fi
  ln -sf $PWD/.config/tmux/wsl2_tmux.conf ~/.config/tmux/tmux.conf
  echo "Created ~/.config/tmux"
  ## Nvim
  ln -sfn $PWD/.config/nvim ~/.config/
  echo "Created ~/.config/nvim"
elif grep -qi Ubuntu /proc/version; then
  # Ubuntu
  echo "Installing dotfiles for Ubuntu..."
  ## Git
  ln -sfn $PWD/.config/git ~/.config/
  echo "Created ~/.config/git"
  ## Starship
  ln -sfn $PWD/.config/starship ~/.config/
  echo "Created ~/.config/starship"
  ## Alacritty
  ln -sfn $PWD/.config/alacritty ~/.config/
  echo "Created ~/.config/alacritty"
  ## Tmux
  if [ ! -d "$XDG_CONFIG_HOME/tmux" ]; then
    mkdir -p "$XDG_CONFIG_HOME/tmux"
  fi
  ln -sf $PWD/.config/tmux/ubuntu_tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf
  echo "Created ~/.config/tmux"
  ## Nvim
  ln -sfn $PWD/.config/nvim ~/.config/
  echo "Created ~/.config/nvim"
elif grep -qi Arch /proc/version; then
  # Arch
  echo "Installing dotfiles for ArchLinux..."
  ## Git
  ln -sfn $PWD/.config/git ~/.config/
  echo "Created ~/.config/git"
  ## Starship
  ln -sfn $PWD/.config/starship ~/.config/
  echo "Created ~/.config/starship"
  ## Alacritty
  ln -sfn $PWD/.config/alacritty ~/.config
  echo "Created ~/.config/alacritty"
  ## Tmux
  if [ ! -d "$XDG_CONFIG_HOME/tmux" ]; then
    mkdir -p "$XDG_CONFIG_HOME/tmux"
  fi
  ln -sf $PWD/.config/tmux/arch_tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf
  echo "Created ~/.config/tmux"
  ## Nvim
  ln -sfn $PWD/.config/nvim ~/.config/
  echo "Created ~/.config/nvim"
  # Sway
  ln -sfn $PWD/.config/sway ~/.config/
  echo "Created ~/.config/sway"
  # waybar
  ln -sfn $PWD/.config/waybar ~/.config/
  echo "Created ~/.config/waybar"
  # wofi
  ln -sfn $PWD/.config/wofi ~/.config/
  echo "Created ~/.config/wofi"
else
  echo "Unsupport"
  exit 1
fi

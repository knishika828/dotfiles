#!/bin/bash

#######################################################
# Needs Package
#######################################################
sudo pacman -Syy --noconfirm 

# Base
sudo pacman -S --noconfirm \
  zsh \
  git \
  curl \
  wget \
  cmake \
  zip \
  unzip \
  ufw \
  networkmanager \
  fcitx6 \
  fcitx6-mozc \
  openssh

# Sway
sudo pacman -S --noconfirm \
  polkit \
  sway \
  swaybg \
  dmenu \
  foot \
  waybar \
  noto-fonts \
  noto-fonts-cjk \
  otf-font-awesome \
  xorg-xwayland \
  qt5-wayland \
  greetd \
  greetd-tuigreet \
  brightnessctl \
  pulseaudio

# Developper Tools
sudo pacman -S --noconfirm \
  starship \
  exa \
  bat \
  fd

# Browser
sudo pacman -S --noconfirm \
  vivaldi \
  firefox


#######################################################
# zshenv
#######################################################
XDG_CONFIG_HOME="${HOME}/.config"
XDG_CACHE_HOME="${HOME}/.cache"
XDG_DATA_HOME="${HOME}/.local/share"
XDG_STATE_HOME="${HOME}/.local/state"
mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_CACHE_HOME"
mkdir -p "$XDG_DATA_HOME"
mkdir -p "$XDG_STATE_HOME"

ZSHENV_FILE="$HOME/.zshenv"
cat > "$ZSHENV_FILE" <<EOF
# XDG Base Directory
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
EOF

source $ZSHENV_FILE


#######################################################
# zsh
#######################################################
if command -v zsh &> /dev/null; then
  echo "Zsh is already installed"
else
  sudo pacman -S --noconfirm zsh 
  echo "Zsh installtion completed"
  sudo chsh -s $(which zsh)
  exec zsh
fi

ln -sf $PWD/.config/.zshrc ~/.zshrc
echo "Created ~/.zshrc"
ln -sfn $PWD/.config/.zsh ~/.zsh
echo "Created ~/.zsh"


#######################################################
# Tmux 
#######################################################
if command -v tmux &> /dev/null; then
  echo "Tmux is already installed"
else
  sudo pacman -S --noconfirm tmux
  echo "Tmux installation completed"
fi


#######################################################
# Alacritty
#######################################################
if command -v alacritty &> /dev/null; then
  echo "Alacritty is already installed"
else
  sudo pacman -S --noconfirm alacritty
  echo "Alacritty installation completed"
fi


#######################################################
# Neovim 
#######################################################
if command -v nvim &> /dev/null; then
  echo "Neovim is already installed"
else
  sudo pacman -S --noconfirm neovim
  echo "Neovim installation completed"
fi


#######################################################
# FZF
#######################################################
if command -v fzf &> /dev/null; then
  echo "FZF is already installed"
else
  sudo pacman -S --noconfirm fzf
  echo "FZF installation completed"
fi


#######################################################
# mise 
#######################################################
if command -v mise &> /dev/null; then
  echo "mise is already installed"
else
  curl https://mise.jdx.dev/install.sh | sh
  echo "mise installation completed"
fi


#######################################################
# Fonts
#######################################################
font_path="/usr/local/share/fonts/PlemolJP_NF_v1.6.0"
if [ -e "$font_path" ]; then
    echo "Fonts are already installed"
else
    # Download the fonts
    FONT_URL="https://github.com/yuru7/PlemolJP/releases/download/v1.6.0/PlemolJP_NF_v1.6.0.zip"
    ZIP_FILE="PlemolJP_NF_v1.6.0.zip"
    EXTRACTED_DIR="PlemolJP_NF_v1.6.0"
    wget -q "$FONT_URL" || { echo "Failed to download fonts. Aborting."; exit 1; }

    # Install the fonts
    unzip -q "$ZIP_FILE" || { echo "Failed to unzip fonts. Aborting."; exit 1; }
    sudo cp -r "$EXTRACTED_DIR" /usr/local/share/fonts/ || { echo "Failed to move fonts. Aborting."; exit 1; }
    sudo fc-cache -f -v 2>&1 | grep -q "succeeded" || { echo "Failed to update font cache."; exit 1; }
    rm -r "$ZIP_FILE" "$EXTRACTED_DIR" || { echo "Failed to delete files."; exit 1; }
    echo "Fonts installation completed"
fi

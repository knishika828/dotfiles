#!/bin/bash

#######################################################
# Needs Packages
#######################################################
sudo apt-get install -yqq \
  build-essential \
  libbz2-dev libdb-dev \
  libreadline-dev \
  libffi-dev \
  libgdbm-dev \
  liblzma-dev \
  libncursesw5-dev \
  libsqlite3-dev \
  libssl-dev \
  zlib1g-dev \
  uuid-dev \
  tk-dev \
  fzf \
  xsel \
  exa \
  bat \
  ripgrep \
  fd-find
echo "Needs Packages installation completed"


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
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME}"
export XDG_DATA_HOME="${XDG_DATA_HOME}"
export XDG_STATE_HOME="${XDG_STATE_HOME}"
EOF

source $ZSHENV_FILE
echo "Created zshenv"


#######################################################
# zsh
#######################################################
if command -v zsh &> /dev/null; then
  echo "Zsh is already installed"
else
  sudo apt-get install -yqq zsh
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
  sudo apt-get install -yqq tmux
  echo "Tmux installation completed"
fi


#######################################################
# Neovim 
#######################################################
curl -sLO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
if [ $? -ne 0 ]; then
    echo "Failed to download Neovim. Exiting the script."
    exit 1
fi
chmod u+x nvim.appimage

# Remove nvim.appimage if the extraction is successful
sudo ./nvim.appimage --appimage-extract > /dev/null 2>&1
if [ -d "squashfs-root" ]; then
    rm nvim.appimage
else
    echo "Extraction might have failed. Continuing without removing nvim.appimage."
    exit 1
fi

# Remove /squashfs-root if it exists at the root
# Consider alternative methods if any issues arise
if [ -d "/squashfs-root" ]; then
    sudo rm -rf /squashfs-root
fi
sudo mv squashfs-root /
sudo ln -sf /squashfs-root/AppRun /usr/bin/nvim

NVIM_VERSION=$(nvim --version | head -n 1)
echo "Installation of $NVIM_VERSION is complete"


#######################################################
# mise 
#######################################################
if command -v mise &> /dev/null; then
  echo "mise is already installed"
else
  curl https://mise.jdx.dev/install.sh | sh
  echo "mise installation completed"
fi

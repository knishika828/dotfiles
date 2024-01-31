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
# starship
#######################################################
if which starship > /dev/null 2>&1; then
  echo "Starship is already installed"
else
  curl -sS https://starship.rs/install.sh | sh
  echo "Starship installation completed"
fi


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
# Alacritty
#######################################################
if command -v alacritty &> /dev/null; then
    echo "Alacritty is already installed"
else
    # Install necessary packages
    sudo apt-get install -yqq cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

    # Clone the repository
    git clone https://github.com/alacritty/alacritty.git

    # Build Alacritty
    (cd alacritty && cargo build --release -q)

    # Install Alacritty
    sudo tic -xe alacritty,alacritty-direct alacritty/extra/alacritty.info
    sudo cp alacritty/target/release/alacritty /usr/local/bin
    sudo cp alacritty/extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
    sudo desktop-file-install alacritty/extra/linux/Alacritty.desktop
    sudo update-desktop-database

    # Remove unnecessary files
    sudo rm -rf alacritty
    echo "Alacritty installation completed"
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
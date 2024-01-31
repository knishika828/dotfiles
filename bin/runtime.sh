#!/bin/bash

ln -sfn $PWD/.config/mise ~/.config/
mise install

#######################################################
# Go Tools
#######################################################
if command -v ghq &> /dev/null; then
  echo "ghq is already installed"
else
  go install github.com/x-motemen/ghq@latest
  echo "ghq installation completed"
fi


#######################################################
# Python Virtualenv For Neovim
#######################################################
virtualenv_for_neovim="$HOME/.local/share/virtualenvs/neovim"
if [ -d "$virtualenv_for_neovim" ]; then
  echo "Python Virtualenv is already set up."
else
  python -m venv "$virtualenv_for_neovim"
  . "$virtualenv_for_neovim/bin/activate"
  pip install neovim
  deactivate
fi

# dotfiles

## WSL2
```bash
$ sudo apt-get update -y
$ sudo apt-get upgrade -y
$ sudo apt-get install git curl make zsh
$ sudo chsh -s $(which zsh)

$ git clone https://github.com/knishika828/dotfiles.git
$ cd dotfiles

$ make setup
$ source ~/.zshrc

$ make runtime
$ make install
```

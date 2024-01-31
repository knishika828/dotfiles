# dotfiles

## WSL2 && Ubuntu
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

## ArchLinux
```bash
$ sudo pacman -Syyu --noconfirm
$ sudo pacman -S git curl make zsh
$ sudo chsh -s $(which zsh)

$ git clone https://github.com/knishika828/dotfiles.git
$ cd dotfiles

$ make setup
$ source ~/.zshrc

$ make runtime
$ make install
```

```bash
$ cat /etc/greetd/config.toml
[terminal]
vt = 1

[default_session]
command = "tuigreet --time --remember --issue --asterisks --cmd sway"

user = "greeter"

$ sudo systemctl enable --now greetd
```

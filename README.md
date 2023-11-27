# dotfiles

There's no place like ~/

![screenshot](https://i.imgur.com/TeOS6uh.png)

```
 dunst      > notification daemon
 git        > git config and aliases
 gpg        > gpg-agent config
 i3         > tiling window manager
 mutt       > email client
 nvim       > text editor config
 picom      > pico compositor
 polybar    > status bar
 ranger     > file manager
 redshift   > screen color temperature
 rofi       > application launcher
 spells     > some automation scripts
 ssh        > ssh-agent service config
 tmux       > terminal multiplexer
 urxvt      > 256 color terminal and some extensions
 vscode     > code editor
 xmap       > some keybindings
 zathura    > document viewer
 zsh        > plugins, themes, and config
 ```

## Usage

I use [stow](https://www.gnu.org/software/stow/) to manage my dotfiles
```
git clone https://github.com/aeolyus/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow zsh # ...and whatever else you want
```

## experimental

The `experimental` directory is an ongoing attempt to create a
deterministic, hermetic configuration for macOS using `nix`. Should this
exploration yield significant benefits, I may consider switching my main OS
from Arch to NixOS.

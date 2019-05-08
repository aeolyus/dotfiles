# dotfiles
```
 dunst      > notification daemon
 git        > git config and aliases
 gpg        > gpg-agent config
 i3         > tiling window manager
 mutt       > email client
 nvim       > text editor config
 polybar    > status bar
 ranger     > file manager
 redshift   > screen color temperature
 rofi       > application launcher
 spells     > some automation scripts
 ssh        > ssh-agent service config
 urxvt      > 256 color terminal and some extensions
 xmap       > some keybindings
 zsh        > oh-my-zsh plugins and themes
 ```

# Usage
I use [stow](https://www.gnu.org/software/stow/) to manage my dotfiles
```
$ git clone https://github.com/aeolyus/dotfiles.git ~/dotfiles
$ cd ~/dotfiles
$ stow zsh # ...and whatever else you want
```

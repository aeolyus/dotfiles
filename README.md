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
 skhd       > keyboard daemon for macOS
 spells     > some automation scripts
 ssh        > ssh-agent service config
 tmux       > terminal multiplexer
 urxvt      > 256 color terminal and some extensions
 vscode     > code editor
 xmap       > some keybindings
 yabai      > tiling window manager for macOS
 zathura    > document viewer
 zsh        > plugins, themes, and config
 ```

# Usage
I use [stow](https://www.gnu.org/software/stow/) to manage my dotfiles
```
git clone https://github.com/aeolyus/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow zsh # ...and whatever else you want
```

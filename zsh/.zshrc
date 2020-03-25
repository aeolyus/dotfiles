# Antibody
alias antibody='antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh'
[[ ! -f ~/.zsh_plugins.sh ]] && antibody
source ~/.zsh_plugins.sh

PURE_PROMPT_SYMBOL=λ

# ZSH Vi Mode
bindkey -v

# ZSH History
setopt extended_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_expire_dups_first
setopt hist_save_no_dups
setopt hist_ignore_space
setopt hist_verify
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=10000

# Up Arrow Completion
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# ZSH Completions
autoload -Uz compinit && compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
unsetopt menu_complete
unsetopt flowcontrol
setopt globdots
setopt auto_menu
setopt always_to_end
setopt complete_in_word
# Group matches and describe.
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
# Kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm"
zstyle ':completion:*:*:kill:*' menu yes select

# Environment Variables
export TERM=xterm-256color
export EDITOR=nvim
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/dotfiles/spells:$GOPATH/bin:$HOME/bin
export LESSHISTFILE=-
export GPG_TTY=$(tty)

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden 2>/dev/null'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --preview-window right:70%'

# Aliases
alias ls='ls --group-directories-first --color=auto'
alias l='ls -lah'
alias ll='ls -lh'
alias rg='rg --hidden'
alias g='git'
alias t='tmux'
alias v='nvim'
alias rr='ranger'
alias irc='weechat'
alias less='less -R'
alias sc='maim -s ~/screenshot.png'
alias mpv='mpv --af=rubberband'
alias emacs='emacs -nw'
alias dc='docker-compose'

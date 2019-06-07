# Antibody
alias antibody='antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh'
[[ ! -f ~/.zsh_plugins.sh ]] && antibody
source ~/.zsh_plugins.sh

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
HISTFILE=~/.cache/.zsh_history
SAVEHIST=10000

# Environment Variables
export EDITOR=nvim
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/dotfiles/spells:$GOPATH/bin

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='find . -printf "%P\\n" 2>/dev/null'
export FZF_CTRL_T_COMMAND='find . -printf "%P\\n" 2>/dev/null'
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --preview-window right:70%'

# ZSH Completions
autoload -Uz compinit && compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
zstyle ':completion:*' menu yes select

# Up Arrow Completion
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Aliases
alias ls='ls --group-directories-first --color=auto'
alias l='ls -la'
alias ll='ls -l'
alias g='git'
alias v='nvim'
alias rr='ranger'
alias irc='weechat'
alias emacs='emacs -nw'
alias vpnu='nmcli con up protonvpn'
alias vpnd='nmcli con down protonvpn'

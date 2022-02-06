include () {
  test -f "$@" && source "$@"
}

# Antibody
alias antibody_setup='antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh'
command -v antibody >/dev/null\
  && [ -f ~/.zsh_plugins.txt ] \
  && [ ! -f ~/.zsh_plugins.sh ] \
  && antibody_setup
include ~/.zsh_plugins.sh

PURE_PROMPT_SYMBOL=λ

# ZSH Vi Mode
bindkey -v
bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word
bindkey "^H" backward-delete-char
bindkey "^U" backward-kill-line

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
setopt interactivecomments
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
export PATH=$PATH:$HOME/dotfiles/spells:$GOPATH/bin:$HOME/bin:$HOME/.cargo/bin
export LESSHISTFILE=-
export GPG_TTY=$(tty)
export BAT_THEME=base16
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# FZF
include ~/.fzf.zsh
include /usr/share/fzf/key-bindings.zsh
include /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden 2>/dev/null'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --preview-window right:70%'

# Kubernetes
# Set the default kube context if present
DEFAULT_KUBE_CONTEXTS="$HOME/.kube/config"
if [ -f "${DEFAULT_KUBE_CONTEXTS}" ]
then
  export KUBECONFIG="$DEFAULT_KUBE_CONTEXTS"
fi
# Additional contexts should be in ~/.kube/contexts
CUSTOM_KUBE_CONTEXTS="$HOME/.kube/contexts"
mkdir -p "$CUSTOM_KUBE_CONTEXTS"
for context_file in `fd '.*.yaml' -t f "$CUSTOM_KUBE_CONTEXTS"`
do
  export KUBECONFIG="$context_file:$KUBECONFIG"
done

# Aliases
alias ls='ls --group-directories-first --color=auto'
alias l='ls -lah'
alias ll='ls -lh'
alias rg='rg --hidden'
alias g='git'
alias t='tmux'
alias v=$EDITOR
alias rr='ranger'
alias irc='weechat'
alias less='less -R'
alias sc='maim -s ~/screenshot.png'
alias mpv='mpv --af=rubberband'
alias emacs='emacs -nw'
alias dc='docker-compose'
alias d='docker'
if [ -x "$(command -v kubectl)" ]; then
  source <(kubectl completion zsh)
  compdef kubecolor='kubectl' # Make completion work with kubecolor
  alias kubectl='kubecolor'
  alias k='kubectl'
fi
alias ze="$EDITOR $HOME/dotfiles/zsh/.zshrc"
alias ve="$EDITOR $HOME/dotfiles/nvim/.config/nvim/init.vim"

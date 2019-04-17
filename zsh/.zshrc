# Oh My Zsh!
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="bullet-train"
BULLETTRAIN_PROMPT_CHAR="λ"
BULLETTRAIN_PROMPT_ORDER=(
  context
  status
  dir
  git
)
DISABLE_AUTO_UPDATE=true
COMPLETION_WAITING_DOTS=true
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.cache/oh-my-zsh/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
plugins=(
  z
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  colored-man-pages
)
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
source $ZSH/oh-my-zsh.sh

# Base 16 shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# ZSH Settings
bindkey -v
_Z_DATA=$HOME/.cache/.z

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='find . -printf "%P\\n" 2>/dev/null'
export FZF_CTRL_T_COMMAND='find . -printf "%P\\n" 2>/dev/null'
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --preview-window right:70%'

# Environment Variables
export EDITOR=nvim

# Aliases
alias g='git'
alias v='nvim'
alias rr='ranger'
alias irc='weechat'
alias vpnu='nmcli con up protonvpn'
alias vpnd='nmcli con down protonvpn'

# Custom Commands
se() {
    du -a . 2>/dev/null | awk '{print $2}' |
    fzf --preview='[[ $(file --mime {}) =~ binary ]] &&
                   echo {} is a binary file ||
                   (highlight -O ansi -l {} ||
                   coderay {} ||
                   rougify {} ||
                   cat {}) 2> /dev/null | head -500' | xargs -r $EDITOR ;
}

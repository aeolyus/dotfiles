export PATH=$PATH:/home/aeolyus/.gem/ruby/2.5.0/bin

ZSH=/usr/share/oh-my-zsh/

ZSH_THEME="bullet-train"

DISABLE_AUTO_UPDATE=true
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

export SSH_KEY_PATH="~/.ssh/rsa_id"
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  ZSH_THEME="bullet-train"
else
  ZSH_THEME="bullet-train"
fi

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Aliases
alias vi='nvim'
alias irc='weechat'
alias rr='ranger'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='find . -printf "%P\\n"'
export FZF_CTRL_T_COMMAND='find . -printf "%P\\n"'

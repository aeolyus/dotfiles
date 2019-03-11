# PATH stuff
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:/home/aeolyus/.gem/ruby/2.6.0/bin:$PATH"
export EDITOR=nvim


# Oh My Zsh!
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="bullet-train"
DISABLE_AUTO_UPDATE=true
COMPLETION_WAITING_DOTS=true
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh


# Base 16 shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"


# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='find . -printf "%P\\n" 2>/dev/null'
export FZF_CTRL_T_COMMAND='find . -printf "%P\\n" 2>/dev/null'
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --preview-window right:70%'


# Custom Commands
se(){du -a . 2>/dev/null | awk '{print $2}' | fzf --preview='[[ $(file --mime {}) =~ binary ]] &&
                                                             echo {} is a binary file ||
                                                             (highlight -O ansi -l {} ||
                                                             coderay {} ||
                                                             rougify {} ||
                                                             cat {}) 2> /dev/null | head -500' | xargs -r $EDITOR ;}


# Aliases
alias g='git'
alias v='nvim'
alias rr='ranger'
alias irc='weechat'

{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    antidote = {
      enable = true;
      plugins = [
        "zsh-users/zsh-completions"
        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-syntax-highlighting"
        "zsh-users/zsh-history-substring-search"
        "mafredri/zsh-async"
        "robbyrussell/oh-my-zsh path:plugins/gitfast"
        "robbyrussell/oh-my-zsh path:plugins/colored-man-pages"
      ];
    };
    plugins = [
      {
        name = "pure";
        src = "${pkgs.pure-prompt}/share/zsh/site-functions";
      }
    ];
    history = {
      # Record timestamp
      extended = true;
      # If a new command line being added to the history list duplicates an
      # older one, the older command is removed from the list (even if it is
      # not the previous event)
      ignoreAllDups = true;
      # Do not enter command lines into the history list if they are duplicates
      # of the previous event
      ignoreDups = true;
      # Do not enter command lines into the history list if the first character
      # is a space
      ignoreSpace = true;
      # Share command history between zsh sessions
      share = true;
      # Number of history lines to keep in memory
      size = 10000;
      # Number of history lines to save to the history file
      save = 10000;
    };
    shellAliases = {
      ls = "ls --color=auto";
      l = "ls -lah";
      ll = "ls -lh";
      less = "less -R"; # ANSI color escape
      g = "git";
      t = "tmux";
      v = "$EDITOR";
      d = "docker";
      dc = "docker-compose";
      k = "kubectl";
      kubectl = "kubecolor";
    };
    envExtra = ''
      # Set editor to neovim
      export EDITOR=nvim
    '';
    initContent = ''
      # Prompt
      autoload -Uz promptinit; promptinit
      prompt pure

      # Custom shell scripts
      export PATH=$PATH:$HOME/dotfiles/spells

      # Enhance vi mode
      # Allow backspace to backward-delete-char
      bindkey "^?" backward-delete-char
      bindkey "^W" backward-kill-word
      bindkey "^H" backward-delete-char
      bindkey "^U" backward-kill-line

      # Up/down arrow completion
      # If in a multiline buffer they move up or down within the buffer,
      # otherwise they search for a history line matching the start of
      # the current line
      autoload -U up-line-or-beginning-search
      autoload -U down-line-or-beginning-search
      zle -N up-line-or-beginning-search
      zle -N down-line-or-beginning-search
      bindkey "^[[A" up-line-or-beginning-search
      bindkey "^[[B" down-line-or-beginning-search

      # ZSH Completions
      command -v brew &>/dev/null && FPATH="$(brew --prefix)/share/zsh/site-functions:''${FPATH}"
      autoload -Uz compinit && compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
      zstyle ':completion:*:*:*:*:*' menu select
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
      zstyle ':completion:*' list-colors '''
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
      zstyle ':completion:*' group-name '''
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
    '';
  };
}

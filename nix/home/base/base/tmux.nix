{ pkgs, ... }:
let
  # NixOS uses uptime from GNU coreutils whereas most other distributions use
  # uptime from procps
  uptime = "${pkgs.procps}/bin/uptime";
in
{
  programs.tmux = {
    enable = true;
    mouse = true;
    terminal = "tmux-256color";
    # Do not use sensible plugin options
    sensibleOnTop = false;
    # Set Ctrl-a as prefix
    shortcut = "a";
    # Prevent delays in vim registering esc key
    escapeTime = 0;
    # Start numbering at 1 for ergonomics
    baseIndex = 1;
    extraConfig = ''
      # True color support
      # https://github.com/tmux/tmux/issues/34
      set-option -ga terminal-overrides ",*256col*:Tc"

      # Use vim-like keys for splits and windows
      bind-key v split-window -h
      bind-key s split-window -v
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
      bind-key S choose-session

      # Numbering
      setw -g pane-base-index 1
      set -g renumber-windows on

      # Status bar
      set -g status-position top
      setw -g status-left " #{session_name} "
      setw -g status-left-style "fg=black bg=white"
      setw -g status-right " #{host} | #(${uptime} -p) "
      setw -g status-right-style "fg=blue bg=black"
      setw -g window-status-current-format " #{window_index}:#{window_name} "
      setw -g window-status-current-style "fg=black bg=green dim"
      set -g status-style "fg=white bg=black dim"
      set -g status-justify left
      set -g message-style "fg=white bg=black bold"
    '';
  };
}

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fd # Alternative to find
    file # File type identification utility
    gnumake # GNU Make
    htop # Interactive process viewer
    pavucontrol # PulseAudio volume control
    pulseaudio # Sound server
    ripgrep # Alternative to grep
    tmux # Terminal multiplexer
    git-branchless # Enhance git stacked diffs
  ];
}

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brightnessctl # Control device brightness
    fd # Alternative to find
    file # File type identification utility
    git-branchless # Enhance git stacked diffs
    gnumake # GNU Make
    htop # Interactive process viewer
    neovim # Text editor
    pavucontrol # PulseAudio volume control
    pulseaudio # Sound server
    ripgrep # Alternative to grep
  ];
}

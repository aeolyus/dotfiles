{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fd # Alternative to find
    file # File type identification utility
    git # Version control system
    git-branchless # Enhance git stacked diffs
    gnumake # GNU Make
    htop # Interactive process viewer
    neovim # Text editor
    ripgrep # Alternative to grep
  ];
}

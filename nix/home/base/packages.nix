{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clang # C language family compiler
    fd # Alternative to find
    file # File type identification utility
    git # Version control system
    git-branchless # Enhance git stacked diffs
    gnumake # GNU Make
    go # Programming language
    htop # Interactive process viewer
    neovim # Text editor
    python3 # Programming language
    ripgrep # Alternative to grep
    spotify # Music player
    unzip # Extraction utility for zip archives
    zip # Compressor/archiver
  ];
}

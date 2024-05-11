{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bazelisk # Build tool
    clang # C language family compiler
    dig # DNS lookup utility
    eternal-terminal # Remote shell
    fd # Alternative to find
    file # File type identification utility
    git # Version control system
    git-branchless # Enhance git stacked diffs
    gnumake # GNU Make
    go # Programming language
    htop # Interactive process viewer
    hyperfine # CLI benchmarking tool
    kubectl # Kubernetes CLI
    mosh # Mobile shell
    neovim # Text editor
    python3 # Programming language
    ripgrep # Alternative to grep
    unzip # Extraction utility for zip archives
    zip # Compressor/archiver
  ];
}

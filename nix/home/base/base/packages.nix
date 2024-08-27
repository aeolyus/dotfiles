{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat # Alternative to cat
    bazelisk # Build tool
    clang # C language family compiler
    dig # DNS lookup utility
    docker # Docker CLI
    docker-compose # Tool to define and run multi-container apps
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
    mpv # Media player
    neovim # Text editor
    procps # procfs utilities, most use procps over GNU coreutils for uptime
    python3 # Programming language
    ripgrep # Alternative to grep
    unzip # Extraction utility for zip archives
    zip # Compressor/archiver
  ];
}

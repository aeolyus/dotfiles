{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat # Alternative to cat
    bazelisk # Build tool
    clang # C language family compiler
    deadnix # Find and remove unused nix code
    dig # DNS lookup utility
    docker # Docker CLI
    docker-compose # Tool to define and run multi-container apps
    eternal-terminal # Remote shell
    fd # Alternative to find
    ffmpeg # Video and audio processing tool
    file # File type identification utility
    gdb # GNU debugger
    ghostscript # PostScript interpreter
    git # Version control system
    git-branchless # Enhance git stacked diffs
    gnumake # GNU Make
    go # Programming language
    htop # Interactive process viewer
    hyperfine # CLI benchmarking tool
    imagemagick # Swiss army knife of image processing
    kubecolor # Colorize kubectl output
    kubectl # Kubernetes CLI
    mosh # Mobile shell
    mpv # Media player
    ncdu # Disk usage analyzer with an ncurses interface
    neovim # Text editor
    procps # procfs utilities, most use procps over GNU coreutils for uptime
    python3 # Programming language
    ripgrep # Alternative to grep
    tree # Command to list directory contents in a tree-like format
    units # Unit conversion tool
    unzip # Extraction utility for zip archives
    zip # Compressor/archiver
  ];
}

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    file
    fzf
    glow
    gnupg
    jq
    nmap
    ripgrep
    tree
    tree
    unzip
    which
    zip
    zstd
  ];
}

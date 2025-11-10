{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox # Web browser
    obsidian # Knowledge base
    spotify # Music player
    zathura # PDF viewer
  ];
}

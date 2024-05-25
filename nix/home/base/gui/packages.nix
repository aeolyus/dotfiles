{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox # Web browser
    spotify # Music player
    zathura # PDF viewer
  ];
}

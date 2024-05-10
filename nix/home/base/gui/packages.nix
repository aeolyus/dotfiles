{ pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify # Music player
    zathura # PDF viewer
  ];
}

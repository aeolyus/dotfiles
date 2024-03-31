{ pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify # Music player
  ];
}

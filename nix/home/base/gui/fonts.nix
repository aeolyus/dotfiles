{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.fira-mono
    nerd-fonts.hack
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];
}

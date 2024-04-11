{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    noto-fonts-emoji
    (nerdfonts.override {
      fonts = [
        "Hack"
        "FiraCode"
      ];
    })
  ];
}

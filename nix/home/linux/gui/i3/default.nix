{
  imports = [
    ./floating.nix
    ./keybindings.nix
    ./modes.nix
    ./screen-locker.nix
    ./startup.nix
    ./wallpaper.nix
  ];

  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
    };
  };
}

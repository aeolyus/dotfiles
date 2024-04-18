{
  imports = [
    ./keybindings.nix
    ./modes.nix
    ./screen-locker.nix
    ./wallpaper.nix
    ./startup.nix
  ];

  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
    };
  };
}

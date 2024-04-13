{
  imports = [
    ./keybindings.nix
    ./modes.nix
    ./screen-locker.nix
  ];

  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
    };
  };
}

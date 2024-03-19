{
  imports = [
    ./keybindings.nix
    ./modes.nix
  ];

  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
    };
  };
}

{
  imports = [
    ./keybindings.nix
  ];

  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
    };
  };
}

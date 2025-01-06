{
  services.picom = {
    enable = true;
    shadow = true;
    vSync = true;
    shadowExclude = [
      "class_g = 'Polybar'"
      "class_g = 'i3bar'"
      # Prevent maim's selector from shadow and dimming screenshots
      # https://github.com/naelstrof/maim/issues/40#issuecomment-126933853
      "name = 'Screenshot'"
      "class_g = 'slop'"
    ];
  };
}

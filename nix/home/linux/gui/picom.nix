{
  services.picom = {
    enable = true;
    shadow = true;
    vSync = true;
    shadowExclude = [
      "class_g = 'Polybar'"
      "class_g = 'i3bar'"
    ];
  };
}

{
  services.picom = {
    enable = true;
    shadow = true;
    vSync = true;
    shadowExclude = [
      "class_g = 'i3bar'"
    ];
  };
}

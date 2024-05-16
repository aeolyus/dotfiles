{
  # Remove default i3bar
  xsession.windowManager.i3.config.bars = [ ];
  services.polybar = {
    enable = true;
    config = ../../../../polybar/.config/polybar/config;
    script = "polybar default &";
  };
}

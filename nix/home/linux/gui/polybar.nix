{ pkgs, ... }:
{
  # Remove default i3bar
  xsession.windowManager.i3.config.bars = [ ];
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      pulseSupport = true;
    };
    config = ../../../../polybar/.config/polybar/config;
    script = "polybar default &";
  };
}

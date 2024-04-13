{ pkgs, ... }:
{
  services.screen-locker = {
    enable = true;
    xautolock.enable = false;
    inactiveInterval = 2; # minutes
    lockCmd = "${pkgs.i3lock-fancy-rapid}/bin/i3lock 5 pixel";
  };
}

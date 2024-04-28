{ pkgs, ... }:
{
  services.screen-locker = {
    enable = true;
    xautolock.enable = false;
    xss-lock.extraOptions = [
      "--transfer-sleep-lock"
    ];
    inactiveInterval = 5; # minutes
    lockCmd = "${pkgs.i3lock-fancy-rapid}/bin/i3lock 5 pixel --nofork";
  };
}

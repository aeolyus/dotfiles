{ pkgs, config, lib, ... }:
let
  cfg = config.services.screen-locker;
in
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

  # Use xautolock to sleep to avoid relying on logind
  systemd.user.services.xautolock-session = {
    Unit = {
      Description = "xautolock, session locker service";
      After = [ "graphical-session-pre.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Install = { WantedBy = [ "graphical-session.target" ]; };

    Service = {
      ExecStart = lib.concatStringsSep " " ([
        "${cfg.xautolock.package}/bin/xautolock"
        "-time 30" # minutes
        "-locker '${pkgs.systemd}/bin/systemctl suspend-then-hibernate'"
      ] ++ lib.optional cfg.xautolock.detectSleep "-detectsleep"
      ++ cfg.xautolock.extraOptions);
    };
  };
}

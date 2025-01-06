# This module makes it so that we use suspend instead of suspend-then-hibernate
#
# My Arch Linux installation on this host has an issue with
# suspend-then-hibernate where during the transition from suspended state to
# hibernation, the computer hangs indefinitely. Separately, suspend and
# hibernate function as intended...
#
# This is a stopgap until this host is migrated to NixOS where hopefully the
# issue does not persist
{ pkgs, config, lib, ... }:
let
  cfg = config.services.screen-locker;
in
{
  systemd.user.services.xautolock-session = lib.mkForce {
    Service = lib.mkForce {
      ExecStart = lib.concatStringsSep " " ([
        "${cfg.xautolock.package}/bin/xautolock"
        "-time 30" # minutes
        "-locker '${pkgs.systemd}/bin/systemctl suspend'"
      ] ++ lib.optional cfg.xautolock.detectSleep "-detectsleep"
      ++ cfg.xautolock.extraOptions);
    };
  };
}

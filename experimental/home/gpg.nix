{ pkgs, ... }:
let
  pinentry = pkgs.pinentry-curses;
  ttl = 43200; # 12 hours in seconds
in
{
  programs.gpg.enable = true;
  home.packages = [
    pinentry
  ];
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = ttl;
    maxCacheTtl = ttl;
    pinentryPackage = pinentry;
    extraConfig = ''
      allow-loopback-pinentry
    '';
  };
}

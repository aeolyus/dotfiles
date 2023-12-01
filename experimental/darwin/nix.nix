{
  imports = [
    ../common/nix.nix
  ];
  # Enable the Nix daemon
  services.nix-daemon.enable = true;
}

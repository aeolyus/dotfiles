{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot = {
    enable = true;
    # Maximum number of latest generations in the boot menu. Useful to prevent
    # boot partition running out of disk space.
    configurationLimit = 10;
  };
  boot.loader.efi.canTouchEfiVariables = true;
}

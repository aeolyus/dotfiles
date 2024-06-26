# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/a2845b4b-fa4b-4931-9d8c-7209aa10b182";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" "noatime" ];
    };

  boot.initrd.luks.devices."enc".device = "/dev/disk/by-uuid/c8892991-e920-459b-b8ca-629d02075d9e";

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/a2845b4b-fa4b-4931-9d8c-7209aa10b182";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" "noatime" ];
    };

  fileSystems."/nix" =
    {
      device = "/dev/disk/by-uuid/a2845b4b-fa4b-4931-9d8c-7209aa10b182";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

  fileSystems."/persist" =
    {
      device = "/dev/disk/by-uuid/a2845b4b-fa4b-4931-9d8c-7209aa10b182";
      fsType = "btrfs";
      options = [ "subvol=persist" "compress=zstd" "noatime" ];
    };

  fileSystems."/var" =
    {
      device = "/dev/disk/by-uuid/a2845b4b-fa4b-4931-9d8c-7209aa10b182";
      fsType = "btrfs";
      options = [ "subvol=var" "compress=zstd" "noatime" ];
    };

  fileSystems."/swap" =
    {
      device = "/dev/disk/by-uuid/a2845b4b-fa4b-4931-9d8c-7209aa10b182";
      fsType = "btrfs";
      options = [ "subvol=swap" "noatime" ];
    };

  swapDevices = [{ device = "/swap/swapfile"; }];

  boot.resumeDevice = "/dev/disk/by-uuid/a2845b4b-fa4b-4931-9d8c-7209aa10b182";
  boot.kernelParams = [
    "resume_offset=795904" # btrfs inspect-internal map-swapfile -r /swap/swapfile
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

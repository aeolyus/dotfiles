{
  # Enable realtime scheduling to increase audio thread priorities
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # No beeping
  boot.blacklistedKernelModules = [
    "pcspkr"
    "snd_pcsp"
  ];
  services.pipewire.extraConfig.pipewire = {
    "99-silent-bell" = {
      "context.properties" = {
        "module.x11.bell" = false;
      };
    };
  };
}

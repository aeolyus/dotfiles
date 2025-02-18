{
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Modesetting is required
    modesetting.enable = true;
    # Enable the Nvidia settings menu, accessible via `nvidia-settings`
    nvidiaSettings = true;
    # Use the Nvidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    open = true;
    # Save entire VRAM memory instead of just bare essentials. Fixes graphical
    # corruption issues after waking up from sleep.
    powerManagement.enable = true;
  };
}

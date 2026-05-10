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

  # CUDA binary cache — avoids building CUDA packages from source
  # https://wiki.nixos.org/wiki/CUDA
  nix.settings = {
    substituters = [
      "https://cache.nixos-cuda.org"
    ];
    trusted-public-keys = [
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
    ];
  };

  # Build nixpkgs packages with CUDA support where available
  # nixpkgs.config.cudaSupport = true;
}

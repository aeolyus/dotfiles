{ pkgs, ... }:

{
  # Auto upgrade nix package
  nix.package = pkgs.nix;
  # Enable flakes globally
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Automatically detect files in the store with identical contents and
  # replaces them with hard links to a single copy
  nix.settings.auto-optimise-store = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # Do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 1w";
  };
}

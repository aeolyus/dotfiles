{ inputs, ... }:
let
  self = inputs.self;
  home-manager = self.inputs.home-manager;
  nixosSystem = inputs.nixpkgs.lib.nixosSystem;
in
nixosSystem {
  system = "x86_64-linux";
  specialArgs = { inherit self; };
  modules = [
    home-manager.nixosModules.home-manager
    ../../common
    ../../home
    ../../nixos
    ../../overlays
    ./hardware-configuration.nix
  ];
}

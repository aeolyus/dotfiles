{ inputs, vars, ... }:
let
  self = inputs.self;
  home-manager = self.inputs.home-manager;
  nixosSystem = inputs.nixpkgs.lib.nixosSystem;
  user = vars.users.aeolyus;
in
nixosSystem {
  system = "x86_64-linux";
  specialArgs = { inherit self inputs user; };
  modules = [
    home-manager.nixosModules.home-manager
    {
      home-manager.users.${user.username} = import ../../../home/linux/gui;
      home-manager.extraSpecialArgs = { inherit user; };
    }
    ../../../common
    ../../../nixos
    ../../../overlays
    ./hardware-configuration.nix
  ];
}

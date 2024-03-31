{ inputs, vars, ... }:
let
  self = inputs.self;
  homeManagerConfiguration = inputs.home-manager.lib.homeManagerConfiguration;
  user = vars.users.aeolyus;
  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in
homeManagerConfiguration {
  inherit pkgs;
  extraSpecialArgs = { inherit self user; };
  modules = [
    ../common/nix.nix
    ../home/linux/base
    ../overlays
  ];
}

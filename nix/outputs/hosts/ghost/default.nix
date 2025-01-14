{ inputs, vars, ... }:
let
  self = inputs.self;
  homeManagerConfiguration = inputs.home-manager.lib.homeManagerConfiguration;
  user = vars.users.aeolyus;
  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in
homeManagerConfiguration {
  inherit pkgs;
  extraSpecialArgs = { inherit self inputs user; };
  modules = [
    ../../../common/nix.nix
    ../../../home/linux/gui
    ../../../overlays
    ./disable-sleep.nix
    {
      targets.genericLinux.enable = true;
      xdg.mime.enable = true;
    }
  ];
}

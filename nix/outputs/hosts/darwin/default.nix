{ inputs, vars, ... }:
let
  self = inputs.self;
  home-manager = self.inputs.home-manager;
  darwinSystem = inputs.darwin.lib.darwinSystem;
  user = vars.users.rihu;
in
darwinSystem {
  system = "aarch64-darwin";
  specialArgs = { inherit self user; };
  modules = [
    home-manager.darwinModules.home-manager
    {
      home-manager.users.${user.username} = import ../../../home/darwin;
      home-manager.extraSpecialArgs = { inherit user; };
    }
    ../../../common
    ../../../darwin
    ../../../overlays
  ];
}

{
  description = "macOS configuration";

  # A set of nix.conf options specific to this flake
  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, darwin, ... }: {
    darwinConfigurations."aarch64-darwin" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./modules/nix.nix
        ./modules/system.nix
      ];
    };

    # nix fmt formatter
    formatter.aarch64-darwin =
      nixpkgs.legacyPackages.aarch64-darwin.nixpkgs-fmt;
  };
}
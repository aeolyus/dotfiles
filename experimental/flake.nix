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
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, darwin, ... }: {
    darwinConfigurations."aarch64-darwin" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./darwin
      ];
    };

    nixosConfigurations."toaster" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./nixos/configuration.nix
      ];
    };

    # nix fmt formatter
    formatter = {
      aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixpkgs-fmt;
      x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    };
  };
}

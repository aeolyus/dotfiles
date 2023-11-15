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

  outputs = { nixpkgs, darwin, home-manager, ... }: {
    darwinConfigurations."aarch64-darwin" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./darwin
        {
          users.users.richardhuang.name = "richardhuang";
          users.users.richardhuang.home = "/Users/richardhuang";
        }

        home-manager.darwinModules.home-manager
        {
          # By default, Home Manager uses a private pkgs instance that is
          # configured via the home-manager.users.$USERNAME.nixpkgs options.
          # Instead, this saves an extra Nixpkgs evaluation, adds consistency,
          # and removes the dependency on NIX_PATH, which is otherwise used for
          # importing Nixpkgs.
          home-manager.useGlobalPkgs = true;
          # By default user packages will not be ignored in favor of
          # environment.systemPackages. Instead, they will be installed to
          # /etc/profiles/per-user/$USERNAME
          home-manager.useUserPackages = true;
          home-manager.users.richardhuang = import ./home;
        }
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

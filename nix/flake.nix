{
  description = "macOS configuration";

  # A set of nix.conf options specific to this flake
  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
  };

  outputs = inputs@{ nixpkgs, utils, ... }:
    let
      vars = import ./vars;
    in
    {
      homeConfigurations."aeolyus.home" = import ./outputs/home.nix {
        inherit inputs vars;
      };

      homeConfigurations."aeolyus.home.gui" = import ./outputs/home-gui.nix {
        inherit inputs vars;
      };

      homeConfigurations."aeolyus.ghost.home.gui" =
        import ./outputs/home-hosts/ghost/default.nix {
          inherit inputs vars;
        };


      darwinConfigurations."aarch64-darwin" = import ./outputs/hosts/darwin {
        inherit inputs vars;
      };

      nixosConfigurations."toaster" = import ./outputs/hosts/toaster {
        inherit inputs vars;
      };
    }
    //
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        # nix fmt formatter
        formatter = pkgs.nixpkgs-fmt;
      }
    );
}

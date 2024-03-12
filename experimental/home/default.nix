{
  home-manager = {
    # By default, Home Manager uses a private pkgs instance that is configured
    # via the home-manager.users.<name>.nixpkgs options. Instead, use the
    # global pkgs that is configured via the system level nixpkgs options. This
    # saves an extra Nixpkgs evaluation, adds consistency, and removes the
    # dependency on NIX_PATH, which is otherwise used for importing Nixpkgs.
    useGlobalPkgs = true;

    # By default packages will be installed to $HOME/.nix-profile. Instead,
    # install to /etc/profiles
    useUserPackages = true;

    users = {
      aeolyus = import ./aeolyus.nix;
    };
  };
}

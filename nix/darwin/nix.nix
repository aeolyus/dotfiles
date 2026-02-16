{
  # Don't let Determinate Nix handle Nix configuration yet
  # https://github.com/nix-darwin/nix-darwin/issues/1298
  # nix.enable = false;

  # Known to corrupt the Nix Store when true
  nix.settings.auto-optimise-store = false;
}

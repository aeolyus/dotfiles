{
  nixpkgs.overlays = [
    (import ./sudo.nix)
  ];
}

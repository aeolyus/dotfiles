{
  nixpkgs.overlays = [
    (import ./sudo.nix)
    (import ./urxvt.nix)
    (import ./polybar.nix)
  ];
}

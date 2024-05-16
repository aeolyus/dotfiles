{
  nixpkgs.overlays = [
    (import ./polybar.nix)
    (import ./sudo.nix)
    (import ./urxvt.nix)
  ];
}

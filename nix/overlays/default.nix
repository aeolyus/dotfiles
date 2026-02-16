{
  nixpkgs.overlays = [
    (import ./polybar.nix)
    (import ./sudo.nix)
    (import ./tmux.nix)
    (import ./gdb.nix)
  ];
}

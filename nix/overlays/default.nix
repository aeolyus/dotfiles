{
  nixpkgs.overlays = [
    (import ./polybar.nix)
    (import ./sudo.nix)
    (import ./tmux.nix)
    (import ./urxvt.nix)
    (import ./git-branchless.nix)
  ];
}

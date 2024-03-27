{ config, lib, pkgs, ... }:

with lib;

{
  config = mkIf pkgs.stdenv.hostPlatform.isDarwin {
    # Install MacOS applications to the user Applications folder. Also update Docked applications
    home.extraActivationPath = with pkgs; [
      rsync
      dockutil
      gawk
    ];
    home.activation.trampolineApps = hm.dag.entryAfter [ "writeBoundary" ] ''
      ${builtins.readFile ./lib.sh}
      fromDir="$HOME/Applications/Home Manager Apps"
      toDir="$HOME/Applications/Home Manager Trampolines"
      sync_trampolines "$fromDir" "$toDir"
    '';
  };
}

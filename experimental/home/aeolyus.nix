let
  username = "aeolyus";
in
{
  imports = [
    ./fzf.nix
    ./urxvt.nix
    ./zsh.nix
    ./i3
    ./gpg.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home = {
    username = username;
    homeDirectory = "/home/${username}";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager
    # release introduces backwards incompatible changes.
    #
    # You can update Home Manager without changing this value. See the Home
    # Manager release notes for a list of state version changes in each
    # release.
    stateVersion = "23.05";
  };
}

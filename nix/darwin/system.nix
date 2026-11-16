{ lib, user, ... }:
{
  system = {
    stateVersion = 4;
    primaryUser = user.username;

    # Executed every time the system boots or `nixos-rebuild`/`darwin-rebuild`
    # is run
    activationScripts.postActivation.text = lib.mkAfter ''
      # Reload the settings from the database and apply them to the current
      # session, so we do not need to logout/login again to make the changes
      # take effect
      launchctl asuser "$(id -u -- ${user.username})" \
        sudo --user=${user.username} -- \
        /System/Library/PrivateFrameworks/SystemAdministration.framework/\
        Resources/activatesettings -u
    '';

    defaults = {
      # 24-hour clock
      menuExtraClock.Show24Hour = true;
    };
  };

  # Create /etc/zshrc that loads the nix-darwin environment
  programs.zsh.enable = true;
  # Remove default prompt
  programs.zsh.promptInit = "";
}

{ config, ... }:
let
  mod = config.xsession.windowManager.i3.config.modifier;
in
{
  xsession.windowManager.i3.config.modes = {
    resize = {
      "h" = "resize shrink width 10 px or 5 ppt";
      "j" = "resize grow height 10 px or 5 ppt";
      "k" = "resize shrink height 10 px or 5 ppt";
      "l" = "resize grow width 10 px or 5 ppt";
      # Alternatively, use arrow keys
      "Left" = "resize shrink width 10 px or 5 ppt";
      "Down" = "resize grow height 10 px or 5 ppt";
      "Up" = "resize shrink height 10 px or 5 ppt";
      "Right" = "resize grow width 10 px or 5 ppt";

      "Escape" = "mode default";
      "Return" = "mode default";
    };
  };

  xsession.windowManager.i3.config.keybindings = {
    "${mod}+r" = "mode resize";
  };
}

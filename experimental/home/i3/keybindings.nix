{ config, pkgs, ... }:
let
  mod = config.xsession.windowManager.i3.config.modifier;
in
{
  # Set main modifier key to super key
  xsession.windowManager.i3.config.modifier = "Mod4";
  xsession.windowManager.i3.config.keybindings = {
    # Start a terminal
    "${mod}+Return" = "exec urxvt";

    # Program launcher
    "${mod}+space" = "exec ${pkgs.dmenu}/bin/dmenu_run";

    # Kill focused window
    "${mod}+Shift+q" = "kill";

    # Change focus
    "${mod}+h" = "focus left";
    "${mod}+j" = "focus down";
    "${mod}+k" = "focus up";
    "${mod}+l" = "focus right";
    # Alternatively, use arrow keys
    "${mod}+Left" = "focus left";
    "${mod}+Down" = "focus down";
    "${mod}+Up" = "focus up";
    "${mod}+Right" = "focus right";

    # Move focused window
    "${mod}+Shift+h" = "move left";
    "${mod}+Shift+j" = "move down";
    "${mod}+Shift+k" = "move up";
    "${mod}+Shift+l" = "move right";
    # Alternatively, use cursor keys:
    "${mod}+Shift+Left" = "move left";
    "${mod}+Shift+Down" = "move down";
    "${mod}+Shift+Up" = "move up";
    "${mod}+Shift+Right" = "move right";

    # Switch workspace
    "${mod}+1" = "workspace 1";
    "${mod}+2" = "workspace 2";
    "${mod}+3" = "workspace 3";
    "${mod}+4" = "workspace 4";
    "${mod}+5" = "workspace 5";
    "${mod}+6" = "workspace 6";
    "${mod}+7" = "workspace 7";
    "${mod}+8" = "workspace 8";
    "${mod}+9" = "workspace 9";
    "${mod}+0" = "workspace 10";

    # Move focused container to workspace
    "${mod}+Shift+1" = "move container to workspace 1";
    "${mod}+Shift+2" = "move container to workspace 2";
    "${mod}+Shift+3" = "move container to workspace 3";
    "${mod}+Shift+4" = "move container to workspace 4";
    "${mod}+Shift+5" = "move container to workspace 5";
    "${mod}+Shift+6" = "move container to workspace 6";
    "${mod}+Shift+7" = "move container to workspace 7";
    "${mod}+Shift+8" = "move container to workspace 8";
    "${mod}+Shift+9" = "move container to workspace 9";
    "${mod}+Shift+0" = "move container to workspace 10";

    # Move workspaces
    "${mod}+Mod1+Shift+h" = "move workspace to output left";
    "${mod}+Mod1+Shift+j" = "move workspace to output down";
    "${mod}+Mod1+Shift+k" = "move workspace to output up";
    "${mod}+Mod1+Shift+l" = "move workspace to output right";

    # Split in horizontal orientation
    "${mod}+v" = "split h";

    # Split in vertical orientation
    "${mod}+s" = "split v";

    # Enter fullscreen mode for the focused container
    "${mod}+f" = "fullscreen toggle";

    # Change container layout (stacked, tabbed, toggle split)
    "${mod}+slash" = "layout stacking";
    "${mod}+apostrophe" = "layout tabbed";
    "${mod}+semicolon" = "layout toggle split";

    # Toggle tiling / floating
    "${mod}+Shift+space" = "floating toggle";

    # Change focus between tiling / floating windows
    "${mod}+d" = "focus mode_toggle";

    # Focus the parent container
    "${mod}+p" = "focus parent";

    # Focus the child container
    "${mod}+c" = "focus child";

    # Make the currently focused window a scratchpad
    "${mod}+Shift+minus" = "move scratchpad";

    # Show the first scratchpad window
    "${mod}+minus" = "scratchpad show";

    # Reload the configuration file
    "${mod}+Shift+c" = "reload";

    # Restart i3 inplace (preserves layout/session, can be used to upgrade i3)
    "${mod}+Shift+r" = "restart";

    # Exit i3 (logs you out of your X session)
    "${mod}+Shift+e" = ''
      exec --no-startup-id \
        "i3-nagbar \
          -t warning \
          -m 'You pressed the exit shortcut. Do you really want to exit i3? \
              This will end your X session.' \
          -b 'Yes, exit i3' 'i3-msg exit'"
    '';
  };
}

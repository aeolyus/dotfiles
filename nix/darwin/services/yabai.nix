{ pkgs, ... }:
let
  yabai = "${pkgs.yabai}/bin/yabai";
in
{
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    config = {
      # Binary space partitioning layout
      layout = "bsp";
      # When focusing a window, put the mouse at its center
      mouse_follows_focus = "on";
      # Automatically focus the window under the mouse
      focus_follows_mouse = "autoraise";
      # New window spawns to the right if vertical split, or bottom if
      # horizontal split
      window_placement = "second_child";
      # Disable opacity for windows
      window_opacity = "off";
      # Padding added around the sides of a space
      top_padding = 12;
      bottom_padding = 12;
      left_padding = 12;
      right_padding = 12;
      # Size of the gap that separates windows
      window_gap = 12;
      # Draw shadow for windows, window_border has been removed
      window_shadow = "on";
      # Add padding for external status bar
      external_bar = "all:0:26";
    };
    extraConfig = ''
      # Float system settings
      ${yabai} -m rule --add app="^System Settings$" manage=off
      ${yabai} -m rule --add app="^System Information$" \
        label="^About This Mac$" manage=off

      # Load scripting addition
      ${yabai} -m signal --add event=dock_did_restart \
        action="sudo ${yabai} --load-sa"
      sudo ${yabai} --load-sa
    '';
  };
}

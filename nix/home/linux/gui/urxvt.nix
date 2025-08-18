{ pkgs, ... }:
let
  # Nord XResources
  # https://github.com/arcticicestudio/nord-xresources
  nord0 = "#2E3440";
  nord1 = "#3B4252";
  # nord2 = "#434C5E";
  nord3 = "#4C566A";
  nord4 = "#D8DEE9";
  nord5 = "#E5E9F0";
  nord6 = "#ECEFF4";
  nord7 = "#8FBCBB";
  nord8 = "#88C0D0";
  nord9 = "#81A1C1";
  # nord10 = "#5E81AC";
  nord11 = "#BF616A";
  # nord12 = "#D08770";
  nord13 = "#EBCB8B";
  nord14 = "#A3BE8C";
  nord15 = "#B48EAD";
in
{
  programs.urxvt = {
    enable = true;
    package = pkgs.rxvt-unicode-emoji;
    scroll = {
      bar.enable = false;
      lines = 10000;
      # Keep scroll position when TTY receives new lines
      keepPosition = true;
      # Scroll to bottom on keyboard input
      scrollOnKeystroke = true;
      # Scroll to bottom on TTY output
      scrollOnOutput = true;
    };
    # Disable ISO 14755 Ctrl+Shift keybind
    iso14755 = false;
    fonts = [
      "xft:Hack Nerd Font Mono:size=9"
      "xft:FiraCode Nerd Font Mono:size=9"
      "xft:Noto Color Emoji:size=9"
      "xft:DejaVu Sans Mono:size=9"
    ];
    keybindings = {
      "C-equal" = "resize-font:bigger";
      "C-minus" = "resize-font:smaller";
      "C-0" = "resize-font:reset";
    };
    extraConfig = {
      # Disable printing the terminal contents when pressing PrintScreen
      print-pipe = "cat > /dev/null";

      # Color scheme
      foreground = nord4;
      background = nord0;
      cursorColor = nord4;
      color0 = nord1;
      color1 = nord11;
      color2 = nord14;
      color3 = nord13;
      color4 = nord9;
      color5 = nord15;
      color6 = nord8;
      color7 = nord5;
      color8 = nord3;
      color9 = nord11;
      color10 = nord14;
      color11 = nord13;
      color12 = nord9;
      color13 = nord15;
      color14 = nord7;
      color15 = nord6;

      # Prevent urxvt opening prompt in middle of screen
      # https://github.com/NixOS/nixpkgs/issues/241646
      geometry = "80x240+0+0";

      # Extensions
      perl-lib = "${pkgs.rxvt-unicode-emoji}/lib/urxvt/perl";
      perl-ext-common = builtins.concatStringsSep "," [
        "default" # Keep default extensions
        "matcher" # Match strings to change their rendition (defaults for URLs)
        "resize-font" # Enable font resizing
        "selection-to-clipboard" # Auto copy selection to the clipboard
        "-confirm-paste" # Disable confirmation before pasting multiline text
      ];
    };
  };
}

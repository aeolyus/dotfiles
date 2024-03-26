{ config, ... }:
{
  programs.rofi = {
    enable = true;
    font = "Hack Nerd Font Bold 10";
    theme =
      let
        # Use `mkLiteral` for string-like values that should show without
        # quotes, e.g.:
        # {
        #   foo = "abc"; => foo: "abc";
        #   bar = mkLiteral "abc"; => bar: abc;
        # };
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        # Global properties
        "*" = {
          border = 0;
          margin = 0;
          padding = 0;
          spacing = 0;

          bg = mkLiteral "#2E3440";
          bg-alt = mkLiteral "#3B4252";
          fg = mkLiteral "#81A1C1";
          fg-alt = mkLiteral "#EBCB8B";

          background-color = mkLiteral "@bg";
          text-color = mkLiteral "@fg";
        };

        "window" = {
          # True transparency, only works with a compositor
          transparency = "real";
        };

        # Wrapper around bar and results
        "mainbox" = {
          children = map mkLiteral [ "inputbar" "listview" ];
        };

        # Input bar at top
        "inputbar" = {
          background-color = mkLiteral "@bg-alt";
          children = map mkLiteral [ "prompt" "entry" ];
        };

        # Text box
        "entry" = {
          background-color = mkLiteral "inherit";
          padding = mkLiteral "12px 3px";
        };

        # Prompt left of the text box
        "prompt" = {
          background-color = mkLiteral "inherit";
          padding = mkLiteral "12px";
        };

        # Results
        "listview" = {
          lines = 8;
        };

        # Each result
        "element" = {
          children = map mkLiteral [ "element-icon" "element-text" ];
        };
        "element-icon" = {
          padding = mkLiteral "10px 10px";
        };
        "element-text" = {
          padding = mkLiteral "10px 0";
        };
        "element-text.selected" = {
          text-color = mkLiteral "@fg-alt";
        };
      };
    extraConfig = {
      # Prompts for each mode
      display-drun = "";
      display-run = "";
      display-window = "";
    };
  };
}

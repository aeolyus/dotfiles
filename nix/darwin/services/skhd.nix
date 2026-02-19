# Remaps common Windows-style Ctrl+key shortcuts to macOS Cmd+key equivalents.
{ lib, pkgs, ... }:
let
  # Apps excluded from ALL Ctrl-to-Cmd remappings (terminals, VMs, remote desktop)
  fullExclude = app: ''"${app}" ~'';
  fullExcludeApps = [
    "Terminal"
    "iTerm2"
  ];

  # Browsers for browser-only shortcuts
  browserApps = [
    "Google Chrome"
    "Safari"
  ];

  mkRemap = { from, to, excludeApps }:
    let
      excludeLines = lib.concatMapStringsSep "\n    " fullExclude excludeApps;
    in
    ''
      ${from} [
          ${excludeLines}
          * : skhd -k "${to}"
      ]
    '';

  mkBrowserOnly = { from, to }:
    let
      browserLines = lib.concatMapStringsSep "\n    "
        (app: ''"${app}" : skhd -k "${to}"'')
        browserApps;
    in
    ''
      ${from} [
          ${browserLines}
          * ~
      ]
    '';

in
{
  services.skhd = {
    enable = true;
    package = pkgs.skhd;

    skhdConfig = ''
      # Copy
      ${mkRemap { from = "ctrl - c"; to = "cmd - c"; excludeApps = fullExcludeApps; }}
      # Paste
      ${mkRemap { from = "ctrl - v"; to = "cmd - v"; excludeApps = fullExcludeApps; }}
      # Cut
      ${mkRemap { from = "ctrl - x"; to = "cmd - x"; excludeApps = fullExcludeApps; }}
      # Select all
      ${mkRemap { from = "ctrl - a"; to = "cmd - a"; excludeApps = fullExcludeApps; }}
      # Undo
      ${mkRemap { from = "ctrl - z"; to = "cmd - z"; excludeApps = fullExcludeApps; }}
      # Redo
      ${mkRemap { from = "ctrl - y"; to = "cmd + shift - z"; excludeApps = fullExcludeApps; }}
      # Find
      ${mkRemap { from = "ctrl - f"; to = "cmd - f"; excludeApps = fullExcludeApps; }}
      # Save
      ${mkRemap { from = "ctrl - s"; to = "cmd - s"; excludeApps = fullExcludeApps; }}
      # New
      ${mkRemap { from = "ctrl - n"; to = "cmd - n"; excludeApps = fullExcludeApps; }}
      # Close window/tab
      ${mkRemap { from = "ctrl - w"; to = "cmd - w"; excludeApps = fullExcludeApps; }}

      # Formatting and tab shortcuts
      # Bold
      ${mkRemap { from = "ctrl - b"; to = "cmd - b"; excludeApps = fullExcludeApps; }}
      # Italic
      ${mkRemap { from = "ctrl - i"; to = "cmd - i"; excludeApps = fullExcludeApps; }}
      # New tab
      ${mkRemap { from = "ctrl - t"; to = "cmd - t"; excludeApps = fullExcludeApps; }}
      # Reopen previously closed tab
      ${mkRemap { from = "ctrl - shift- t"; to = "cmd - shift - t"; excludeApps = fullExcludeApps; }}

      # Browser-only shortcuts
      # Focus URL bar
      ${mkBrowserOnly { from = "ctrl - l"; to = "cmd - l"; }}
      # Reload page
      ${mkBrowserOnly { from = "ctrl - r"; to = "cmd - r"; }}

      # Word navigation
      # Move one word left
      ${mkRemap { from = "ctrl - left"; to = "alt - left"; excludeApps = fullExcludeApps; }}
      # Move one word right
      ${mkRemap { from = "ctrl - right"; to = "alt - right"; excludeApps = fullExcludeApps; }}
      # Delete word
      ${mkRemap { from = "ctrl - backspace"; to = "alt - backspace"; excludeApps = fullExcludeApps; }}

      # Print
      ${mkRemap { from = "ctrl - p"; to = "cmd - p"; excludeApps = fullExcludeApps; }}
      # Open file
      ${mkRemap { from = "ctrl - o"; to = "cmd - o"; excludeApps = fullExcludeApps; }}
    '';
  };
}

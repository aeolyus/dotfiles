# Remap keys on Apple keyboards (VendorID 0x5ac) only,
# so non-Apple keyboards are unaffected.
let
  keyMappings = [
    {
      # Caps Lock -> Left Control
      HIDKeyboardModifierMappingSrc = 30064771129;
      HIDKeyboardModifierMappingDst = 30064771296;
    }
  ];
  matching = builtins.toJSON { VendorID = 1452; };
  mapping = builtins.toJSON { UserKeyMapping = keyMappings; };
in
{
  # Apply immediately on darwin-rebuild switch.
  # NOTE: Don't use system.keyboard options
  # (e.g. remapCapsLockToControl) as their activation
  # script resets all mappings globally.
  system.activationScripts.remap-apple-keyboard.text = ''
    /usr/bin/hidutil property --matching '${matching}' --set '${mapping}'
  '';

  # Apply on boot.
  launchd.daemons.remap-apple-keyboard = {
    serviceConfig = {
      Label = "com.local.remap-apple-keyboard";
      ProgramArguments = [
        "/usr/bin/hidutil"
        "property"
        "--matching"
        matching
        "--set"
        mapping
      ];
      RunAtLoad = true;
    };
  };
}

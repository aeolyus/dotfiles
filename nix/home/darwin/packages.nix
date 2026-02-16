{ pkgs, ... }:
{
  home.packages = with pkgs; [
    iterm2 # Terminal emulator
    unnaturalscrollwheels # Invert scroll direction for physical scroll wheels
  ];
}

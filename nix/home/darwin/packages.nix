{ pkgs, ... }:
{
  home.packages = with pkgs; [
    iterm2 # Terminal emulator
  ];
}

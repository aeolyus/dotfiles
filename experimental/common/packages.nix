{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fd # Alternative to find
    file # File type identification utility
    ripgrep # Alternative to grep
    gnumake # GNU Make
  ];
}

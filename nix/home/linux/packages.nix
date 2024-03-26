{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brightnessctl # Control device brightness
    google-chrome # Browser
    pavucontrol # PulseAudio volume control
    pulseaudio # Sound server
    spotify # Music player
  ];
}

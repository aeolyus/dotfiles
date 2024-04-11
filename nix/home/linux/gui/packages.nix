{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brightnessctl # Control device brightness
    google-chrome # Browser
    pavucontrol # PulseAudio volume control
    playerctl # CLI MRPIS media player controller
    pulseaudio # Sound server
    xclip # CLI interface to X11 clipboard
  ];
}

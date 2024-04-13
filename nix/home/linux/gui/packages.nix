{ pkgs, ... }:
{
  home.packages = with pkgs; [
    brightnessctl # Control device brightness
    feh # Light-weight image viewer and wallpaper display
    google-chrome # Browser
    i3lock-fancy-rapid # Screen locker
    pavucontrol # PulseAudio volume control
    playerctl # CLI MRPIS media player controller
    pulseaudio # Sound server
    xclip # CLI interface to X11 clipboard
  ];
}

{ pkgs, ... }:
{
  home.packages = with pkgs; [
    arandr # Another XRandR GUI
    autorandr # Auto select display config based on connected devices
    brightnessctl # Control device brightness
    feh # Light-weight image viewer and wallpaper display
    google-chrome # Browser
    i3lock-fancy-rapid # Screen locker
    lutris # Open Source gaming platform for GNU/Linux
    maim # CLI screenshot utility
    pavucontrol # PulseAudio volume control
    playerctl # CLI MRPIS media player controller
    pulseaudio # Sound server
    xclip # CLI interface to X11 clipboard
    xorg.xdpyinfo # Display information utility for X
    xorg.xset # User preference utility for X
  ];
}

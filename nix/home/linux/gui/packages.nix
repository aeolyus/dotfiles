{ pkgs, ... }:
{
  home.packages = with pkgs; [
    arandr # Another XRandR GUI
    brightnessctl # Control device brightness
    discord # All-in-one voice and text chat for gamers
    dragon-drop # Simple drag-and-drop source/sink for X
    feh # Light-weight image viewer and wallpaper display
    google-chrome # Browser
    i3lock-fancy-rapid # Screen locker
    libreoffice # Productivity software suite
    lutris # Open Source gaming platform for GNU/Linux
    maim # CLI screenshot utility
    pavucontrol # PulseAudio volume control
    playerctl # CLI MRPIS media player controller
    pulseaudio # Sound server
    xclip # CLI interface to X11 clipboard
    xdpyinfo # Display information utility for X
    xmodmap # Modify keymaps and pointer button mappings for X
    xset # User preference utility for X
  ];
}

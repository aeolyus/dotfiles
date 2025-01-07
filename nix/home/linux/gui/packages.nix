{ pkgs, ... }:
{
  home.packages = with pkgs; [
    arandr # Another XRandR GUI
    autorandr # Auto select display config based on connected devices
    brightnessctl # Control device brightness
    discord # All-in-one voice and text chat for gamers
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
    xdragon # Simple drag-and-drop source/sink for X
    xorg.xdpyinfo # Display information utility for X
    xorg.xmodmap # Modify keymaps and pointer button mappings for X
    xorg.xset # User preference utility for X
  ];
}

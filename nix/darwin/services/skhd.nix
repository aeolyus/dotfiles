{
  services.skhd = {
    enable = true;
    skhdConfig = ''
      # Default mode
      :: default

      # Workspace focus
      alt - 1 : yabai -m space --focus 1
      alt - 2 : yabai -m space --focus 2
      alt - 3 : yabai -m space --focus 3
      alt - 4 : yabai -m space --focus 4
      alt - 5 : yabai -m space --focus 5
      alt - 6 : yabai -m space --focus 6
      alt - 7 : yabai -m space --focus 7
      alt - 8 : yabai -m space --focus 8
      alt - 9 : yabai -m space --focus 9
      alt - 0 : yabai -m space --focus 10

      # Move windows to another workspace
      alt + shift - 1 : yabai -m window --space 1
      alt + shift - 2 : yabai -m window --space 2
      alt + shift - 3 : yabai -m window --space 3
      alt + shift - 4 : yabai -m window --space 4
      alt + shift - 5 : yabai -m window --space 5
      alt + shift - 6 : yabai -m window --space 6
      alt + shift - 7 : yabai -m window --space 7
      alt + shift - 8 : yabai -m window --space 8
      alt + shift - 9 : yabai -m window --space 9
      alt + shift - 0 : yabai -m window --space 10

      # Navigation
      alt - h : yabai -m window --focus west
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - l : yabai -m window --focus east

      # Moving windows
      shift + alt - h : yabai -m window --warp west
      shift + alt - j : yabai -m window --warp south
      shift + alt - k : yabai -m window --warp north
      shift + alt - l : yabai -m window --warp east

      # Move floating window
      shift + alt - h : yabai -m window --move rel:-20:0
      shift + alt - j : yabai -m window --move rel:0:20
      shift + alt - k : yabai -m window --move rel:0:-20
      shift + alt - l : yabai -m window --move rel:20:0

      # Float/unfloat windows
      shift + alt - space : yabai -m window --toggle float; \
      yabai -m window --grid 4:4:1:1:2:2

      # Fullscreen
      alt - f : yabai -m window --toggle zoom-fullscreen
      shift + alt - f : yabai -m window --toggle native-fullscreen

      # Resize mode
      :: resize @

      ## Enter resize mode
      alt - r ; resize

      ## Leave resize mode
      resize < escape ; default

      ## Resize mode key bindings
      resize < h : \
          yabai -m window --resize left:-20:0 ; \
          yabai -m window --resize right:-20:0
      resize < j : \
          yabai -m window --resize bottom:0:20 ; \
          yabai -m window --resize top:0:20
      resize < k : \
          yabai -m window --resize top:0:-20 ; \
          yabai -m window --resize bottom:0:-20
      resize < l : \
          yabai -m window --resize right:20:0 ; \
          yabai -m window --resize left:20:0

      # Resize windows
      ctrl + alt - h : \
          yabai -m window --resize left:-20:0 ; \
          yabai -m window --resize right:-20:0

      ctrl + alt - j : \
          yabai -m window --resize bottom:0:20 ; \
          yabai -m window --resize top:0:20

      ctrl + alt - k : \
          yabai -m window --resize top:0:-20 ; \
          yabai -m window --resize bottom:0:-20

      ctrl + alt - l : \
          yabai -m window --resize right:20:0 ; \
          yabai -m window --resize left:20:0

      # Toggle window split type with semicolon
      alt - 0x29 : yabai -m window --toggle split

      # Balance size of windows
      shift + alt - 0 : yabai -m space --balance
      ctrl + alt - 0 : yabai -m space --balance

      # Workspace init
      ctrl + alt - n : yabai -m space --create && \
                            index="$(yabai -m query --spaces --display | jq 'map(select(."native-fullscreen" == 0))[-1].index')" && \
                            yabai -m space --focus "''${index}"
      ctrl + alt - d : yabai -m space --destroy

      # Terminal
      alt - return : pgrep -f "iTerm" \
        && osascript -e 'tell application "iTerm2" to create window with default profile' \
        || open -a "/Applications/iTerm.app"

      # Toggle sticky(+float), topmost, picture-in-picture
      cmd - p : yabai -m window --toggle sticky;\
      yabai -m window --toggle topmost;\
      yabai -m window --toggle pip

      # Restart
      alt + shift - r : brew services restart skhd && brew services restart yabai
    '';
  };
}

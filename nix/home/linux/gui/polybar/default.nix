{
  # xsession.windowManager.i3.config.bars = [ ];
  services.polybar = {
    enable = true;
    script = "polybar -r default &";
    settings = {
      "colors" = {
        bg = "#2E3440";
        bg-alt = "#3B4252";
        fg = "#ECEFF4";
        fg-alt = "#E5E9F0";

        red = "#BF616A";
        blue = "#88C0D0";
        orange = "#D08770";

        trans = "#00000000";
      };
      "bar/default" = {
        font-0 = "Hack Nerd Font Mono:size=9;2";
        font-1 = "FiraCode Nerd Font Mono:size=9;2";
        font-2 = "Noto Color Emoji:size=9;2";
        font-3 = "DejaVu Sans Mono:size=9;2";
        bottom = true;
        height = 20;
        line-size = 2;
        background = "\${colors.bg}";
        foreground = "\${colors.fg}";
        modules-left = "xworkspaces";
        modules-center = "round-left volume round-right";
      };
      "module/volume" = {
        type = "internal/pulseaudio";
        format-volume = "<label-volume>";
        # ramp.volume = [ "" "" ];
        format.volume.prefix = "";
        label.volume.background = "\${colors.bg-alt}";
        label.volume.foreground = "\${colors.fg}";
        label.volume.prefix-background = "\${colors.bg-alt}";
        label.volume.prefix-foreground = "\${colors.fg}";
        label.volume.padding = 1;

        label.muted.text = "󰖁 muted";
        label.muted.background = "\${colors.bg-alt}";
        label.muted.foreground = "\${colors.fg}";
        label.muted.prefix-background = "\${colors.red}";
        label.muted.prefix-foreground = "\${colors.bg}";
        label.muted.padding = 1;
        # click.right = "pavucontrol &";
      };
      "module/round-left" = {
        type = "custom/text";
        format = "%{T2}%{T-}";
        foreground = "\${colors.bg-alt}";
      };
      "module/round-right" = {
        type = "custom/text";
        format = "%{T6}%{T-}";
        foreground = "\${colors.bg-alt}";
      };
      "module/xworkspaces" = {
        type = "internal/xworkspaces";
        label-active = "%name%";
        label-active-background = "\${colors.blue}";
        label-active-foreground = "\${colors.bg}";
        label-active-padding = 1;
        label-occupied-padding = 1;
        label-urgent-padding = 1;
        label-empty-padding = 1;
      };
    };
  };
}

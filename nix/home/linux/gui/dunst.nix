{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        ### Display ###
        # Which monitor should the notifications be displayed on
        monitor = 0;
        # Follow window with keyboard focus
        follow = "keyboard";
        # Constant width
        width = 300;
        # The maximum height of a single notification, excluding the frame
        height = 100;
        # Offset from the origin
        offset = "10+30";
        # Show how many messages are currently hidden (because of
        # notification_limit)
        indicate_hidden = true;
        # Transparency of window
        transparency = 0;
        # Size of gap to display between notifications - requires a compositor
        gap_size = 4;
        # Padding between text and separator
        padding = 8;
        # Horizontal padding
        horizontal_padding = 8;
        # Width in pixels of frame around the notification window
        frame_width = 2;
        # Color of the frame around the notification window
        frame_color = "#88c0d0";
        # Sort by urgency
        sort = "urgency_descending";
        # Don't remove messages, if the user is idle (no mouse or keyboard
        # input) for longer than idle_threshold seconds
        idle_threshold = 30;

        ### Text ###
        font = "Hack Nerd Font Mono 9";
        foreground = "#d8dee9";
        # The spacing between lines. If the height is smaller than the font
        # height, it will get raised to the font height
        line_height = 0;
        # Allow a small subset of html markup in notifications
        markup = "full";
        # The format of the message
        # %s summary
        # %b body
        format = "<b>%s</b>\n%b";
        # Alignment of message text
        alignment = "left";
        # Show age of message if message is older than show_age_threshold
        # seconds
        show_age_threshold = 60;
        # Specifies  whether to wrap the text if the lines get longer than the
        # maximum notification width. If it's set to true, long lines will be
        # broken into multiple lines expanding the notification window height
        # as necessary for them to  fit. If the text doesn't fit in the window,
        # it will be ellipsized according to ellipsize
        word_wrap = true;
        # Specify where to make an ellipsis in long lines
        ellipsize = "middle";
        # Ignore newlines '\n' in notifications
        ignore_newline = false;
        # Stack together notifications with the same content
        stack_duplicates = true;
        # Hide the count of stacked notifications with the same content
        hide_duplicate_count = false;
        # Display indicators for URLs (U) and actions (A)
        show_indicators = true;

        ### Icons ###
        # Align icons
        icon_position = "left";
        # Scale larger icons down to this size
        max_icon_size = 32;

        ### History ###
        # Should a notification popped up from history be sticky or timeout as
        # if it would normally do
        sticky_history = true;
        # Maximum amount of notifications kept in history
        history_length = 20;

        ### Misc/Advanced ###
        # Define the title of the windows spawned by dunst (X11 only)
        title = "Dunst";
        # Define the class of the windows spawned by dunst (X11 only)
        class = "Dunst";

        ### Mouse ###
        # Defines list of actions for each mouse event
        mouse_left_click = "do_action, open_url";
        mouse_right_click = "close_current";
      };
      urgency_low = {
        background = "#2e3440";
        foreground = "#d8dee9";
        frame_color = "#4c566a";
        timeout = 10;
      };
      urgency_normal = {
        background = "#2e3440";
        timeout = 10;
      };
      urgency_critical = {
        background = "#bf616a";
        foreground = "#d8dee9";
        frame_color = "#bf616a";
        # Disable timeout
        timeout = 0;
      };
    };
  };
}

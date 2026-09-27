{ config, pkgs, ... }: {

  programs.kitty = {
    enable = true;
  # Terminal theme
    themeFile = "tokyo_night_night";

    settings = {
    # Window options
      confirm_os_window_close = 0;
      enable_audio_bell = true;
    # Padding
      window_padding_width = 12;
      window_padding_height = 12;

    # Background
      background_opacity = "0.85";
      dynamic_background_opacity = true;
      background_blur = 25;

    # Cursor
      cursor_shape = "beam";
      cursor_shape_unfocused = "beam";
      cursor_trail = 1;

    # Fonts
      font_size = "12.0";
    # Font Family
      font_family = "JetBrainsMono Nerd Font";
      bold_font = "JetBrainsMono Nerd Font Bold";
      italic_font = "JetBrainsMono Nerd Font Italic";
      bold_italic_font = "JetBrainsMono Nerd Font Bold Italic";
    };
  };

}

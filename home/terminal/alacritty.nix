{ pkgs, config, ... }: {
# Alacritty terminal with JetBrains Mono NF and my custom theme
  programs.alacritty = {
    enable = true;
    theme = "tokyo_night";
  # Alacritty terminal settings
    settings = {
    # Change window tittle
      window = {
        title = "This is Hahacritty";
        opacity = 0.85;
        padding = {
          x = 12;
          y = 12;
        };
        dynamic_padding = false;
        resize_increments = true;
      };
    # Custom cursor interaction
      cursor = {
        style = {
          shape = "Beam";
          blinking = "On";
        };
        blink_interval = 150;
        blink_timeout = 0;
      };
    # Set fonts JetBrainsMono Nerd Font
      font = {
        size = 12;
      # Regular Font
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
      # Bold Font
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
      # Italic Font
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
      # Bold Italic Font
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold Italic";
        };
      };
    };
  };
}

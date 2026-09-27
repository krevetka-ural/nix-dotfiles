{ config, pkgs, username, ... }: {
# Enable Home Manager
  programs.home-manager.enable = true;

# Home username & directory
  home.username = username;
  home.homeDirectory = "/home/${username}";

# Imports home configs
  imports = [

  # Terminal
#    ./terminal/alacritty.nix
    ./terminal/kitty.nix

  # CLI-utils
    ./terminal/btop.nix
    ./terminal/fastfetch.nix
    ./terminal/fish.nix
    ./terminal/starship.nix

  # Window manager and desktop
    ./desktop/niri.nix
    ./desktop/noctalia.nix

    ./desktop/gtkqt.nix
    ./desktop/cursor.nix

  ];

# Home packages
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

# State Version Home Manager
  home.stateVersion = "26.05";
}

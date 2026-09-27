{ config, pkgs, hostname, ... }: {
# Hostname for network
  networking.hostName = hostname;

# Network Manager
  networking.networkmanager.enable = true;

# Power management
  services.power-profiles-daemon.enable = true;

# Enable xorg
  services.xserver.enable = true;

# Keyboard xorg config
  services.xserver.xkb = {
    layout = "us,ru"; # Engilsh and Russian
    options = "grp:caps_toggle"; # Change keyboard layout via 'CAPS LOCK'
  };

# Use Xkeyboard config in TTY
  console.useXkbConfig = true;

# Remove xterm
  services.xserver.excludePackages = [ pkgs.xterm ];

# Set font in TTY
  console.font = "ter-138b";

# Auto clear old generatons after 7 days
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };
}

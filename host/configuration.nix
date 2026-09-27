{ config, pkgs, lib, ... }: {
# Import system configs
  imports =
    [
      ./hardware-configuration.nix

      ../modules/audio.nix
      ../modules/boot.nix
      ../modules/desktop.nix
      ../modules/flatpak.nix
      ../modules/greeter.nix
      ../modules/nvidia.nix
      ../modules/steam.nix
      ../modules/system.nix
      ../modules/user.nix
    ];

# Locale (Russian)
  i18n.defaultLocale = "ru_RU.UTF-8"; # or "us_US.UTF-8"
  time.timeZone = "Europe/Moscow"; # or "Asia/Yekaterinburg";

# Enable Flakes and experimental
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Lix for Sesbian Lex >:)
  nix.package = pkgs.lixPackageSets.stable.lix;

# Allow unfree software
  nixpkgs.config.allowUnfree = true;

# Virtual machines enabling
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  networking.firewall.trustedInterfaces = [ "virbr0" ];

# Programs for Nautilus
  services.gvfs.enable = true;
  services.udisks2.enable = true;

# KDE Connect
  programs.kdeconnect.enable = true;

# AmneziaVPN
  programs.amnezia-vpn.enable = true;

# System packages
  environment.systemPackages = with pkgs; [
  # CLI
    git
    curl
    wget

  # Cursor
    bibata-cursors

  # Fonts
    terminus_font
    jetbrains-mono
    nerd-fonts.jetbrains-mono

  # Other
    firefox
    vesktop
    obsidian
    nautilus
    vscodium
    obs-studio
    adwsteamgtk
    prismlauncher
    xwayland-satellite
  ];

# State version ("26.05" Yarara or "26.11" Zokor)
  system.stateVersion = "26.05";
}

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

# ENG:
# I don't respect Omarchy and DHH

#   I condemn what DHH is saying.
#   He's a crazy, far-right techno-f*****t who has no place at Linux or FOSS.
#   If you think he's promoting his projects just for good reasons,
# know this: he's a crazy, far-right, money-grubbing ba***d.

#   He's sc**ed major companies out of the ballpark of $15 million.
#   I don't want to support people like that, much less use their products.
#   Omarchy is just a money laundering scheme for those $15 million.
#   I'm against AI in such large commercial projects and against DHH's far-right ideas.
#   Don't even try to convince me otherwise.

#   Of course, I also use AI to support my projects,
# but I don't try to commercialize them and rather
# use AI as reference information for searching wikis or forums.

# For Freedom in Free Software!

#---------------------------------------------------------------------------------------#

# RUS:
#   Я не уважаю Omarchy и DHH

#   Я осуждаю то, что говорит DHH.
# Он сумасшедший, ультраправый техно-ф****т, которому нет места в Linux и Свободном ПО.

#   Если Вы думаете, что он продвигает свои проекты просто из благих целей,
# знайте: он сумасшедший, ультраправый, жадный до денег уб***к.

#   Он за*****л крупные компании на сумму около 15 миллионов долларов.
# Я не хочу поддерживать таких людей, тем более использовать их продукты.
#   Omarchy — это просто огромный отмыв 15-ти миллионов долларов,
# которые могли пойти на развитие других проектов.
#   Я против использования ИИ в таких крупных коммерческих проектах
# и Я ​​против ультраправых идей DHH.
#   Даже не пытайтесь меня переубедить.

#   Конечно, Я тоже использую ИИ для поддержки своих проектов,
# но Я не пытаюсь их коммерциализировать, а скорее
# использую ИИ в качестве справочной информации для поиска в вики или на форумах.

#   За Свободу в Свободном ПО!
}

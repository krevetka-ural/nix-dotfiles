{ config, pkgs, username, ... }: {

  services.displayManager.noctalia-greeter = {
    enable = true;
    settings = {
      keyboard.layout = "us,ru";
    };
    cursorTheme.package = pkgs.bibata-cursors;
    settings.cursor = {
      size = 24;
      name = "Bibata-Modern-Classic";
    };
  };

}

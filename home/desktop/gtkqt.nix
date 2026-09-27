{ config, pkgs, ... }: {

  gtk = {
    enable = true;

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = "Adwaita Sans";
      size = 12;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style.name = "adwaita-dark";
  };

  home.sessionVariables = {
    GTK_THEME = "Adwaita:dark";
    QT_QPA_PLATFORMTHEME = "gtk3";
    QT_STYLE_OVERRIDE = "adwaita-dark";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  };
}

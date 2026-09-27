{ config, pkgs, ... }: {

  xdg.configFile = {
  # Niri
    "niri/config.kdl".source = ./niri/config.kdl;
    "niri/binds.kdl".source = ./niri/binds.kdl;
    "niri/noctalia.kdl".source = ./niri/noctalia.kdl;
  };

}

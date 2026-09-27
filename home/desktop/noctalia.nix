{ config, pkgs, ... }: {

  programs.noctalia = {
    enable = true;
    settings = ./noctalia/noctalia-config.toml;
  };

}

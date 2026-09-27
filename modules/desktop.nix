{ config, pkgs, inputs, ... }: {

  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
  };

  programs.xwayland.enable = true;

# Enable XDG Portal
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };

}

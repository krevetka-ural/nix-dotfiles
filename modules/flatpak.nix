{ config, pkgs, inputs, ... }: {

  services.flatpak = {
    enable = true;

    remotes = [ {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      } ];

    packages = [
      "org.vinegarhq.Sober" # YAY! ROBLAX!
      "io.github.kukuruzka165.materialgram"
    ];

    update.onActivation = true;
  };
}

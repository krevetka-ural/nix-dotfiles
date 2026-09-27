{ pkgs, username, hostname, ... }: {
#  <*>< <*>< <*>< 
  programs.fish = {
    enable = true;

  # Disable greeting and show fastfetch
    interactiveShellInit = ''
      set fish_greeting
      sleep 0.2
      fastfetch
    '';

  # Aliases for fish
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#${hostname}";
      ddeell = "sudo nix-collect-garbage -d";
      snano = "sudo nano";
      home = "cd /etc/nixos/modules/home";
      edit = "cd /etc/nixos";
      okay = "sudo reboot";
      bye = "sudo poweroff";
      ff = "fastfetch";
      bb = "bash";
      bt = "btop";
    };
  };
}

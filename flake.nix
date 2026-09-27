{
  description = "NixOS + Home Manager flake config";

#--------------#
# Flake Inputs #
#--------------#
  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix Flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    # Noctalia
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Noctalia Greeter
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Niri
    niri = {
      url = "github:epireyn/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

#---------------#
# Flake Outputs #
#---------------#
  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-flatpak,
    noctalia, noctalia-greeter,
    niri,
    ...
  }@inputs:

    # Set custom nickname
    let
      username = "CHANGE_THIS";
      hostname = "THIS_TOO";
    in

    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs hostname username noctalia niri;
        };

        modules = [
          # Per-host system configuration
          ./host/configuration.nix

          inputs.noctalia-greeter.nixosModules.default
          nix-flatpak.nixosModules.nix-flatpak

          # Home Manager, wired in as a NixOS module
          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = false;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { inherit inputs username hostname; };

            home-manager.users.${username}.imports = [
              ./home/${username}.nix
              inputs.niri.homeModules.niri
            ];
          }

        ];

      };
    };
}

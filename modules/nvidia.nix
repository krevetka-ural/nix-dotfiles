{ config, pkgs, ... }: {

# Graphics for GPU
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # For Steam and etc. 32-bit programs
  };

# Change nvidia drivers in xserver
  services.xserver.videoDrivers = [ "nvidia" ];

# Nvidia drivers
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

}

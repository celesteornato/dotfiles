{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  hardware.graphics.enable = true;
  hardware.nvidia.open = false;

  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };
}

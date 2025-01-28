{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  services.xserver.displayManager.gdm.enable = true;
}

{ pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.displayManager.lightdm.enable = false;
  services.displayManager.sddm.enable = false;
}

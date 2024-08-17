{pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxPackages_latest;
  services.xserver.displayManager.gdm.enable = true; # The Dell has an Nvidia and cannot boot into wayland from gdm
}

{
  imports = [
    ./nvidia.nix
  ];
  services.blueman.enable = true;
  boot = {
    kernelParams = [
      "drm.edid_firmware=eDP-1:edid/1920x1080.bin"
    ];
    kernelPackages = pkgs.linuxPackages_6_8;
  };
}

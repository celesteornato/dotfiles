{ pkgs, ... }: let
  mac-style-src = pkgs.fetchFromGitHub {
    owner = "SergioRibera";
    repo = "s4rchiso-plymouth-theme";
    rev = "bc585b7f42af415fe40bece8192d9828039e6e20";
    sha256 = "sha256-yOvZ4F5ERPfnSlI/Scf9UwzvoRwGMqZlrHkBIB3Dm/w=";
  };
  mac-style-load = pkgs.callPackage mac-style-src {};
in {
  boot = {
    plymouth = {
      enable = true;
      theme = "mac-style";
      themePackages = [ mac-style-load ];
    };
    initrd.systemd.enable = true;
    kernelParams = [
      "nosgx"
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "fbcon=nodefer"
      "udev.log_priority=3"
    ];
    loader.timeout = 0;
  };
}


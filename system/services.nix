{ pkgs, ... }:
{
  services = {

    logind.extraConfig = ''
      HandlePowerKey=ignore
      HandleLidSwitch=suspend
      HandleLidSwitchExternalPower=ignore
    '';

    fwupd.enable = true;
    pcscd.enable = true;

    power-profiles-daemon.enable = false;
    emacs = {
      enable = true;
      package = pkgs.emacs;
    };
    printing = {
      enable = true;
      allowFrom = [ "all" ];
      browsing = true;
      defaultShared = true;
      openFirewall = true;
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      publish = {
        enable = true;
        userServices = true;
      };
    };

    # Bluetooth
    blueman.enable = true;

    # Touchpad
    libinput.enable = true;
    xserver = {
      enable = false;
      xkb.layout = "fr";
      xkb.variant = "";
    };

    openssh.enable = true;
    earlyoom.enable = true;
    systembus-notify.enable = true;
  };
}

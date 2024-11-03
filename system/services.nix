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

    tlp = {
      enable = true;
      settings = {
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "default";
        PLATFORM_PROFILE_ON_BAT = "low-power";
        START_CHARGE_THRESH_BAT0 = 70;
        STOP_CHARGE_THRESH_BAT0 = 80;
        INTEL_GPU_MIN_FREQ_ON_BAT = 500;
      };
    };
    power-profiles-daemon.enable = false;

    printing = {
      enable = true;
      allowFrom = [ "all" ];
      browsing = true;
      defaultShared = true;
      openFirewall = true;
      drivers = [ pkgs.hplipWithPlugin ];
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
      enable = true;
      xkb.layout = "fr";
      xkb.variant = "";
    };

    openssh.enable = true;
    earlyoom.enable = true;
  };
}

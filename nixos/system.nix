{pkgs, ...}: {
  # nix
  documentation.nixos.enable = false; # .desktop
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  # dconf
  programs.dconf.enable = true;

  programs.fish.enable = true;
  users.users.main.shell = pkgs.fish;
  programs.nix-ld.enable = true;
  security.rtkit.enable = true;

  # packages
  environment.systemPackages = with pkgs; [
    home-manager
    earlyoom
    btop
    htop
    fish
    neovim
    git
    wget
    i3
    steam
    wineWowPackages.waylandFull
    opera
  ];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; 
    dedicatedServer.openFirewall = true; 
  };

  # services
  services = {
    printing = {
        enable = true;
        allowFrom = [ "all" ];
        browsing = true;
        defaultShared = true;
        openFirewall = true;
        #drivers = [pkgs.hplipWithPlugin];
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

      # Sound
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };

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


  # logind
  services.logind.extraConfig = ''
    HandlePowerKey=ignore
    HandleLidSwitch=suspend
    HandleLidSwitchExternalPower=ignore
  '';

  # kde connect
  networking.firewall = rec {
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  # network
  networking.networkmanager.enable = true;

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings.General.Experimental = true; # for gnome-bluetooth percentage
  };

  # bootloader
  boot = {
      loader.systemd-boot.enable = true;
      loader.efi.canTouchEfiVariables = true;
      # Custom param to counter a manufacturing defect
      kernelParams = [
        "drm.edid_firmware=eDP-1:edid/1920x1080.bin"
      ];
      kernelPackages = pkgs.linuxPackages_6_8;
  };


  system.stateVersion = "23.05";
}

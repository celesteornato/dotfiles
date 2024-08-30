{pkgs, ...}: {
  # nix
  documentation.nixos.enable = false; # .desktop
  services.thermald.enable = true; # Intel laptop thermal manager
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  programs.gnupg.agent.enable = true;

  # dconf
  programs.dconf.enable = true;

  programs.fish.enable = true;
  users.users.main.shell = pkgs.fish;
  programs.nix-ld = {
    enable = true;
  };
  security.rtkit.enable = true;

  # packages
  environment.systemPackages = with pkgs; [
    home-manager
    earlyoom
    emptty
    btop
    htop
    fish
    vim
    neovim
    git
    wget
    i3
    wineWowPackages.waylandFull
    plymouth
    opera
    thermald
    tlp
    powertop
    python312
    fwupd
    neomutt
    mutt-wizard
    gnupg24
    pinentry
    pass
    isync
    msmtp
    notmuch
    abook
  ];

  # services
  services = {
    fwupd.enable = true;
    pcscd.enable = true;
    
    tlp = {
      enable = true;
      settings = {
        CPU_ENERGY_PERF_POLICY_ON_AC="performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT="default";
	PLATFORM_PROFILE_ON_BAT="low-power";
        START_CHARGE_THRESH_BAT0 = 45;
        STOP_CHARGE_THRESH_BAT0 = 50;
      };
    };
    power-profiles-daemon.enable = false;

    printing = {
      enable = true;
      allowFrom = [ "all" ];
      browsing = true;
      defaultShared = true;
      openFirewall = true;
      drivers = [pkgs.hplipWithPlugin];
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

  # network
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 631 ];
  
  nixpkgs.config.packageOverrides = pkgs: {
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
  };
  hardware.enableAllFirmware = true;
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      libvdpau-va-gl 
    ];
  };
  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };

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
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };



  system.stateVersion = "23.05";

}

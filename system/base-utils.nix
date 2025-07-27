{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Dezippers
    unzip
    gzip
    gnutar
    unrar

    # Necessities
    git
    wget
    lynx
    firefox
    gnumake
    bmake
    steam-run
    kitty
    vim
    btop
    gnupg24
    pinentry
    networkmanager
    networkmanagerapplet
    # Some software (i.e. trenchbroom) does not cite dolphin as a
    # dependency but will break without it
    kdePackages.dolphin
    nautilus

    # Drivers, services
    thermald
    fwupd
    earlyoom
    os-prober

    # Nixos
    home-manager
  ];
}

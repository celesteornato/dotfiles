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
    steam-run
    kitty
    vim
    helix
    btop
    gnupg24
    pinentry

    # Drivers, services
    tlp
    hplip
    plymouth
    thermald
    fwupd
    earlyoom

    # Nixos
    home-manager
  ];
}

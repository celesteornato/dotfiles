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
    btop
    gnupg24
    pinentry

    # Some software (i.e. trenchbroom) does not cite dolphin as a
    # dependency but will break without it
    dolphin
    nautilus

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

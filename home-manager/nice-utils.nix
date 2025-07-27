{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    fragments # Torrents
    pulseaudio # Audio Mixer
    mpv # Video Player
    feh # Image reader
    fastfetch # Neofetch replacement
    vesktop # BetterDiscord
    element-desktop # Matrix client
    signal-desktop
    obs-studio # Screen recorder
    lazydocker # Docker interface
    lazygit # Git interface
    libreoffice # Office suite
    wineWowPackages.waylandFull # Wine
    winetricks # Wine prefix manager
    freecad-wayland # CAD software
    krita # Image editing & drawing
  ];
}

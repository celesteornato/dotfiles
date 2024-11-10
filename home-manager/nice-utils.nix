{
  inputs,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    fragments # Torrents
    mpv # Video Player
    feh # Image reader
    fastfetch # Neofetch replacement
    vesktop # BetterDiscord
    obs-studio # Screen recorder
    lazydocker # Docker interface
    lazygit # Git interface
    libreoffice # Office suite
    wineWowPackages.waylandFull # Wine
  ];
}

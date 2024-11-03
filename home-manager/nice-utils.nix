{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    fragments # Torrents
    mpv # Video Player
    feh # Image reader
    fastfetch # Neofetch replacement
    vesktop # BetterDiscord
    obs-studio # Screen recorder
    blender # 3D modeler
    lazydocker # Docker interface
    lazygit # Git interface
  ];
}

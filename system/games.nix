{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    steam
    vitetris
    prism
    prismlauncher
    gamemode
    mangohud
  ];
}

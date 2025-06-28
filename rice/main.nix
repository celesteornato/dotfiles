{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    swayfx

    hyprlock
    tofi
    waybar
    playerctl
    brightnessctl
    jq
    swaynotificationcenter
    sway-contrib.grimshot
    wl-clipboard
  ];
}

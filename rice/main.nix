{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    sway

    swaylock
    rofi
    waybar
    playerctl
    brightnessctl
    jq
    swaynotificationcenter
  ];
}

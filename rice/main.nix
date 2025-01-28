{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    sway

    swaylock
    rofi
    waybar
    gdm
    playerctl
    brightnessctl
    jq
  ];
}

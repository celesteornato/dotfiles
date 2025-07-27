{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    steam
    prism
    prismlauncher
    gamemode
    mangohud

    bsdgames
    nethack
    nethack-qt
  ];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}

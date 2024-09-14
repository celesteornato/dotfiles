{
  hardware.graphics.enable32Bit = true;
  hardware.pulseaudio.support32Bit = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;  
    dedicatedServer.openFirewall = true;  
    localNetworkGameTransfers.openFirewall = true;  
  };
}

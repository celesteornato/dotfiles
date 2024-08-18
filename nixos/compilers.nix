{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    gpp
    rustup
    cargo
    zulu
    python3
    nodejs
  ];
}

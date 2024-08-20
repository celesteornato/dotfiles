{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    gpp
    rustup
    cargo
    zulu
    gradle
    python3
    nodejs
  ];
}

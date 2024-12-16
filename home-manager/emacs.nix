{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mu
    emacsPackages.mu4e
    cmake
    libtool
  ];
}

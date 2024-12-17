{ pkgs, ... }:
{
  home.packages = with pkgs; [
  	emacs
    cmake
    libtool
  ];
}

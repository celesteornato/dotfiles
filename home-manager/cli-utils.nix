{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    man-pages
    bat
    eza
    fd
    ripgrep
    fzf
  ];
}

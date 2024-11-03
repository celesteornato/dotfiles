{ pkgs, ... }:
let
  switch = pkgs.writeShellScriptBin "switch" ''
    sudo nixos-rebuild switch --flake "$HOME/dotfiles" --impure
  '';
  upgrade = pkgs.writeShellScriptBin "upgrade" ''
    nix flake update
    sudo nixos-rebuild switch --flake "$HOME/dotfiles" --impure
  '';
in
{
  home.packages = [
    switch
    upgrade
  ];
}

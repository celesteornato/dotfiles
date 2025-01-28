{ pkgs, ... }:
let
  switch = pkgs.writeShellScriptBin "switch" ''
    sudo nixos-rebuild switch --flake "$HOME/dotfiles"#"nixos-tp" --impure
  '';
  upgrade = pkgs.writeShellScriptBin "upgrade" ''
    nix flake update
    sudo nixos-rebuild switch --flake "$HOME/dotfiles"#"nixos-tp" --impure
  '';
in
{
  home.packages = [
    switch
    upgrade
  ];
}

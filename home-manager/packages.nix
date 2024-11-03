{ inputs, pkgs, ... }:
{
  imports = [
    ./nice-utils.nix
    ./cli-utils.nix
    ./zsh.nix
    ./dev.nix
    ../scripts/nx-switch.nix
    ../scripts/blocks.nix
  ];
}

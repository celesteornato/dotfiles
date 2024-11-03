{ pkgs, ... }:
let
  username = "main";
in
{
  imports = [
    ./system.nix
    ./base-utils.nix
    ./audio.nix
    ../rice/systemwide.nix
    ./games.nix
  ];
}

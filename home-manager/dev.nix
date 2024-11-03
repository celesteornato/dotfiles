{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    godot_4
    godot_4-export-templates
    jetbrains.rider

    docker

    gparted
    distrobox

    rustup
    clang-tools
    gcc
    gpp
    ocaml
  ];
}

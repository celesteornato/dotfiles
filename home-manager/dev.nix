{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    godot_4
    godot_4-export-templates
    jetbrains.rider

    gparted

    docker
    distrobox

    ffmpeg

    rustup
    clang-tools
    gcc
    gpp
    ocaml
    nasm
    qemu
    (
      with dotnetCorePackages;
      combinePackages [
        sdk_6_0
        sdk_7_0
        sdk_8_0
      ]
    )
  ];
}

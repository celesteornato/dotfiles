{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    godot_4-mono
    godot_4-export-templates
    jetbrains.rider

    gparted

    docker
    distrobox

    ffmpeg

    rustup
	python3
    clang-tools
    clang
    gpp
    ocaml
    nasm
    qemu
    dotnet-sdk_8
  ];
}

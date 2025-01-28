{ inputs, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    # godot_4-mono
    # godot_4-export-templates
    gparted

    docker
    distrobox

    ffmpeg

    rustup
    python3
    llvmPackages_19.clang-tools
    llvmPackages_19.clang
    gpp
    ocaml
    nasm
    qemu

    (
      with dotnetCorePackages;
      combinePackages [
        dotnetCorePackages.sdk_8_0
        dotnetCorePackages.sdk_7_0
        dotnetPackages.Nuget
      ]
    )
  ];
}

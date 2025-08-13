{ pkgs, username, ... }:
{

  environment.systemPackages = with pkgs; [
    # godot_4-mono
    # godot_4-export-templates
    docker
    distrobox

    ffmpeg

    texliveFull
    zip

    rustup
    python3
    nil
    llvmPackages_19.clang-tools
    llvmPackages_19.clang
    gpp
    asm-lsp
    ocaml

    nasm
    qemu
    xorriso
    pkg-config

    libdatachannel
    linuxHeaders
    # (
    #   with dotnetCorePackages;
    #   combinePackages [
    #     dotnetCorePackages.sdk_8_0
    #     dotnetPackages.Nuget
    #   ]
    # )
  ];
  programs.adb.enable = true;
  users.users.${username}.extraGroups = [ "adbusers" ];
}

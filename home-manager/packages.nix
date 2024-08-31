{inputs, pkgs, ...}: {
  imports = [
    ./modules/packages.nix
    ./scripts/blocks.nix
    ./scripts/nx-switch.nix
    ./scripts/vault.nix
  ];
  packages = with pkgs; {
    linux = [
      (mpv.override {scripts = [mpvScripts.mpris];})
      fragments
      fastfetch
      vitetris
      nvtopPackages.full
      prism
      prismlauncher
      vesktop
      gamemode
      mangohud
      figma-linux
      kitty
      stable.librewolf
      fishPlugins.bobthefish
      hplip
      obs-studio
      obsidian
      blender
      freecad
      openmw
      steam-run
      godot_4
      godot_4-export-templates
      lynx
      lastpass-cli
    ];
    cli = [
      bat
      eza
      fd
      ripgrep
      fzf
      lazydocker
      lazygit
    ];
  };
}

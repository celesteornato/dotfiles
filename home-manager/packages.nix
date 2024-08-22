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
      inputs.nix-software-center.packages.${system}.nix-software-center
      # gnome-secrets
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
      librewolf
      # yabridge
      # yabridgectl
      # wine-staging
      mov-cli
      hplip
      obs-studio
      obsidian
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

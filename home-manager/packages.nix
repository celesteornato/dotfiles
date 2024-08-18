{pkgs, ...}: {
  imports = [
    ./modules/packages.nix
    ./scripts/blocks.nix
    ./scripts/nx-switch.nix
    ./scripts/vault.nix
  ];

  packages = with pkgs; {
    linux = [
      (mpv.override {scripts = [mpvScripts.mpris];})
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

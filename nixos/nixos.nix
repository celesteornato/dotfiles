{
  inputs,
  lib,
  ...
}: let
  username = "main";
in {
  imports = [
    ./system.nix
    ./audio.nix
    ./locale.nix
    ./plymouth.nix
    ./hyprland.nix
    ./compilers.nix
    ./nvim.nix
  ];

  nixpkgs.config.allowUnfree = true;
  hyprland.enable = true;


  users.users.${username} = {
    isNormalUser = true;
    initialPassword = username;
    extraGroups = [
      "nixosvmtest"
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "libvirtd"
      "docker"
    ];
  };

  home-manager = {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    users.${username} = {
      home.username = username;
      home.homeDirectory = "/home/${username}";
      imports = [
        ../home-manager/dconf.nix
        ../home-manager/git.nix
        ../home-manager/hyprland.nix
        ../home-manager/packages.nix
        ../home-manager/sh.nix
        ../home-manager/theme.nix
        ../home-manager/tmux.nix
        ../home-manager/kitty.nix
        ../home-manager/helix.nix
        ./home.nix
      ];
    };
  };


}

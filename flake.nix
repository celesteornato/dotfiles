{
  description = "Full system flake, made to work with Aylur's GTK Shell";

  inputs = {

    #--------------------------------------------------#
    #             Inputs linked to the system          #
    #--------------------------------------------------#
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.05";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #--------------------------------------------------#

    #--------------------------------------------------#
    #    Inputs linked to Asztal's Hyprland config     #
    #--------------------------------------------------#
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprland-hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };
    matugen.url = "github:InioX/matugen?ref=v2.2.0";
    ags.url = "github:Aylur/ags";
    astal.url = "github:Aylur/astal";
    lf-icons = {
      url = "github:gokcehan/lf";
      flake = false;
    };
    #--------------------------------------------------#

    #--------------------------------------------------#
    #     Inputs linked to my cool personal rice       #
    #--------------------------------------------------#
    textfox.url = "github:adriankarlen/textfox";
  };
  outputs =
    inputs@{
      self,
      nixpkgs-stable,
      nixpkgs,
      nixos-hardware,
      home-manager,
      ...
    }:
    let
      overlay-stable = final: prev: { stable = import nixpkgs-stable; };
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      packages.x86_64-linux.default = pkgs.callPackage ./ags {
        inherit inputs;
      };

      nixosConfigurations."nixos-tp" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
          asztal = self.packages.x86_64-linux.default;

          hostname = "nixos-tp";
          username = "main";
        };

        modules = [
          (
            { config, pkgs, ... }:
            {
              nixpkgs.overlays = [ overlay-stable ];
            }
          )
          ./system/main.nix
          nixos-hardware.nixosModules.lenovo-thinkpad-t480s
          home-manager.nixosModules.home-manager
        ];
      };

    };
}

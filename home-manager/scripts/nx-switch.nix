{pkgs, ...}: let

  nx-switch = pkgs.writeShellScriptBin "nx-switch" ''
    sudo nixos-rebuild switch --flake ".#$1" --impure
    sudo rm -rf ~/.config/nvim/
    sudo cp -r ./nvim ~/.config/nvim
  '';
  nx-boot = pkgs.writeShellScriptBin "nx-boot" ''
    sudo nixos-rebuild boot --flake ".#$1" --impure
    sudo rm -rf ~/.config/nvim/
    sudo cp -r ./nvim ~/.config/nvim
  '';
  nx-test = pkgs.writeShellScriptBin "nx-test" ''
    sudo nixos-rebuild test --flake ".#$1" --impure
    sudo rm -rf ~/.config/nvim/
    sudo cp -r ./nvim ~/.config/nvim
  '';
in {
  home.packages = [nx-switch nx-boot nx-test];
}

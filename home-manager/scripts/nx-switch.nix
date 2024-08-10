{pkgs, ...}: let
  symlink = pkgs.writeShellScript "symlink" ''
    if [[ "$1" == "-r" ]]; then
      rm -rf "$HOME/.config/nvim"
      rm -rf "$HOME/.config/ags"
    fi

    if [[ "$1" == "-a" ]]; then
      rm -rf "$HOME/.config/nvim"
      rm -rf "$HOME/.config/ags"
      ln -s "$HOME/dotfiles/nvim" "$HOME/.config/nvim"
      ln -s "$HOME/dotfiles/ags" "$HOME/.config/ags"
    fi
  '';
  nx-switch = pkgs.writeShellScriptBin "nx-switch" ''
    sudo nixos-rebuild switch --flake . --impure $@
  '';
  nx-boot = pkgs.writeShellScriptBin "nx-boot" ''
    sudo nixos-rebuild boot --flake . --impure $@
  '';
  nx-test = pkgs.writeShellScriptBin "nx-test" ''
    sudo nixos-rebuild test --flake . --impure $@
  '';
in {
  home.packages = [nx-switch nx-boot nx-test];
}

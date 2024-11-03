{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    starship
    oh-my-zsh
    zsh-nix-shell
    thefuck
    zsh-autocomplete
    zsh-autosuggestions
  ];
}

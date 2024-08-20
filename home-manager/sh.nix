{
  pkgs,
  config,
  lib,
  ...
}: let
  aliases = {
    "db" = "distrobox";
    "tree" = "eza --tree";
    "nv" = "nvim";

    "ll" = "ls";
    "éé" = "ls";
    "és" = "ls";
    "l" = "ls";

    ":q" = "exit";
    "q" = "exit";

    "gs" = "git status";
    "gb" = "git branch";
    "gch" = "git checkout";
    "gc" = "git commit";
    "ga" = "git add";
    "gr" = "git reset --soft HEAD~1";

    "del" = "gio trash";
  };
in {
  options.shellAliases = with lib; mkOption {
    type = types.attrsOf types.str;
    default = {};
  };

  config.programs = {
    fish = {
      # shellAliases = aliases // config.shellAliases;
      enable = true;
    };
    bash = {
      shellAliases = aliases // config.shellAliases;
      enable = false;
      initExtra = "SHELL=${pkgs.bash}";
    };
  };
}

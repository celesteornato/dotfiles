{
  lib,
  pkgs,
  inputs,
  ...
}:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "tokyonight";
      editor = {
        auto-format = true;
        auto-save = true;
        line-number = "relative";
        mouse = false;
        bufferline = "multiple";
        cursor-shape.insert = "bar";
      };
      keys = {
        normal.esc = [
          "collapse_selection"
          "keep_primary_selection"
        ];
        normal."C-r" = {
          t = ":sh dotnet test";
          r = ":sh cargo run";
        };
      };
    };
    languages = {
      language-server.roslyn.command = "roslyn-language-server";
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
        }
        {
          name = "c-sharp";
          auto-format = true;
          language-servers = [ "roslyn" ];
          formatter.command = lib.getExe pkgs.csharpier;
        }
        {
          name = "rust";
          auto-format = true;
          formatter.command = "rustfmt";
        }
      ];
    };
    extraPackages = with pkgs; [
      rust-analyzer
    ];
  };
}

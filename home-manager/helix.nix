{
  lib,
  inputs,
  pkgs,
  config,
  ...
}:
{

  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = pkgs.unstable.helix;
    settings = {
      theme = "gruvbox_dark_hard";
      editor = {
        end-of-line-diagnostics = "hint";
        inline-diagnostics.cursor-line = "error";
        idle-timeout = 0;
        auto-format = true;
        auto-save = true;
        line-number = "relative";
        mouse = false;
        bufferline = "multiple";
        cursor-shape.insert = "bar";
        statusline = {
          left = [
            "mode"
            "spinner"
            "file-modification-indicator"
          ];
          center = [
            "file-name"
            "version-control"
          ];
          right = [
            "position"
            "position-percentage"
            "register"
            "spacer"
          ];
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
        };
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
        normal = {
          "C-s" = ":write";
          "S-tab" = ":buffer-next";
          "C-n" = ":new";

          "C-t" =
            ":sh kitty @ focus-window --match 'title:hx-terminal and state:parent_active' || kitty @ launch --no-response --keep-focus --cwd=current --title=hx-terminal";
          "A-j" = [
            "extend_to_line_bounds"
            "delete_selection"
            "paste_after"
          ];
          "A-k" = [
            "extend_to_line_bounds"
            "delete_selection"
            "move_line_up"
            "paste_before"
          ];
          "A-J" = [
            "extend_to_line_bounds"
            "yank"
            "paste_after"
          ];
          "A-K" = [
            "extend_to_line_bounds"
            "yank"
            "paste_before"
          ];
        };
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
        }
        {
          name = "c-sharp";
          auto-format = true;
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
      omnisharp-roslyn
    ];
  };
}

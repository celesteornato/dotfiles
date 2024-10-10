{pkgs, config, upkgs, lpkgs, lib, ...}: {
  programs.helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "horizon-dark";
        editor = {
          auto-format = true;
          auto-save = true;
          bufferline = "multiple";
          line-number = "relative";
          mouse = false;
          rulers = [ 100 ];
          text-width = 80;

          indent-guides = {
            render = true;
            characters = "╎";
          };

          file-picker.hidden = false;

          lsp.display-inlay-hints = true;

          soft-wrap.wrap-at-text-width = false;
        };
        keys =
          let
            disable-arrow-keys = false;
            noop-arrow-keys = lib.optionalAttrs disable-arrow-keys { up = "no_op"; down = "no_op"; left = "no_op"; right = "no_op"; };
          in
          {
            normal = {
              "space" = {
                # Swap original keybinds, default (lowercase) searches in `pwd`
                f = "file_picker_in_current_directory";
                F = "file_picker";
              };

              # Toggle inlay hints
              "A-u" = ":toggle lsp.display-inlay-hints";
              # Toogle wrapping
              # TODO: change to `soft-wrap.enable` when supported by `:toggle`
              "A-w" = ":toggle soft-wrap.wrap-at-text-width";

              # TODO: try to have `d`,`c` noyank versions by default
            } // noop-arrow-keys;
            insert = noop-arrow-keys;
          };
      };

      # TODO: should change module definition to put these as suffix and avoid shadowing
      extraPackages = with pkgs; [
        ansible-language-server
        clang-tools
        gopls
        kotlin-language-server
        ltex-ls
        marksman
        nil
        nodePackages.bash-language-server
        nodePackages.typescript-language-server
        python311Packages.python-lsp-server
        taplo
        typst-lsp
        rust-analyzer
        vscode-langservers-extracted
        yaml-language-server
        csharp-ls
        csharpier
        haskell-language-server
        stylish-haskell
      ];

      languages = {
        language-server = {
          rust-analyzer.config = { check.command = "clippy"; };

          ltex-ls.command = "ltex-ls";
        };

        language = [
          { name = "c"; auto-format = true; formatter = { command = lib.getExe' pkgs.clang-tools "clang-format"; args = [ ]; }; }
          { name = "html"; language-servers = [ "vscode-html-language-server" ]; }
          { name = "markdown"; language-servers = [ "marksman" ]; }
          { name = "nix"; language-servers = [ "nil" ]; auto-format = true; }
          { name = "python"; language-servers = [ "pylsp" ]; }
          { name = "rust"; language-servers = [ "rust-analyzer" ]; auto-format=true;}
          { name = "typescript"; language-servers = [ "typescript-language-server" ]; }
          { name = "c-sharp"; language-servers = [ "csharp-ls" ]; auto-format = true; }
          { name = "haskell"; language-servers = [ "haskell-language-server" ]; auto-format = true; }
          # { name = "caml"; language-servers = [ "ocamllsp" ];}
        ];
      };
    };
}

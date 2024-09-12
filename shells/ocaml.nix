let
    pkgs = import <nixpkgs> {
        overlays = [];
    };
in 
    pkgs.mkShell {
        packages = with pkgs.ocamlPackages; [
  	      ocaml-lsp
              utop
              ocamlformat
              alcotest

        ];
    }

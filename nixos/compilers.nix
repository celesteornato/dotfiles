{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    gpp
    rustup
    cargo
    zulu
    gradle
    python3
    python312Packages.pip
    nodejs
    cmake
    gnumake
    opam
    ocamlPackages.ocaml-lsp
    ocamlPackages.utop
    ocamlPackages.ocamlformat
    ocamlPackages.alcotest
  ];
}

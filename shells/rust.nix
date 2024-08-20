let
    rust-overlay = (import (builtins.fetchTarball "https://github.com/oxalica/rust-overlay/archive/master.tar.gz"));
    pkgs = import <nixpkgs> {
        overlays = [ rust-overlay ];
    };
in 
    pkgs.mkShell {
        packages = with pkgs; [
            cargo
            rustc
            rustup
            rustfmt
            pkg-config
            openssl
        ];

        env = {
            RUST_BACKTRACE = "full";
            RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
        };
    }

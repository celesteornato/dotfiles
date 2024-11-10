{ config, username, ... }:
{
  news.display = "show";

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    warn-dirty = false;
  };

  home = {
    stateVersion = "21.11";
    sessionVariables = {
      QT_XCB_GL_INTEGRATION = "none"; # kde-connect
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
      BAT_THEME = "base16";
      GOPATH = "${config.home.homeDirectory}/.local/share/go";
      GOMODCACHE = "${config.home.homeDirectory}/.cache/go/pkg/mod";
    };

    sessionPath = [
      "$HOME/.local/bin"
    ];
  };

  gtk.gtk3.bookmarks =
    let
      home = config.home.homeDirectory;
    in
    [
      "file://${home}/Documents"
      "file://${home}/Music"
      "file://${home}/Pictures"
      "file://${home}/Downloads"
      "file://${home}/Desktop"
      "file://${home}/.config Config"
      "file://${home} Home"
    ];

  programs.home-manager.enable = true;
}

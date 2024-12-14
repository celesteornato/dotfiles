{ pkg, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkg.emacs-nox;
  };
}

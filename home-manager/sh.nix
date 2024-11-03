{ pkgs, config, ... }:
{
  programs = {
    zsh = {
      enable = true;
      shellAliases = {
        "tree" = "eza --tree";
        "nv" = "nvim";

        "ll" = "ls";
        "l" = "ls";

        ":q" = "exit";
        "q" = "exit";
      };

      oh-my-zsh = {
        enable = true;
        plugins = [
          "thefuck"
          "sudo"
          "colorize"
          "colored-man-pages"
          "fancy-ctrl-z"
        ];
        theme = "robbyrussell";
      };

      history.size = 10000;
      history.ignoreAllDups = true;
      history.path = "$HOME/.zsh_history";
      history.ignorePatterns = [
        "rm *"
        "pkill *"
        "cp *"
      ];
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      prezto.editor.keymap = "vi";
    };

    starship = {
      enable = true;
      settings = {
        add_newline = true;
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };
      };
    };
  };
}

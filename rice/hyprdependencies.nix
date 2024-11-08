{
  pkgs,
  inputs,
  config,
  asztal,
  lib,
  ...
}:
{
  config = {
    nix.settings = {
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };

    services.xserver.displayManager.startx.enable = true;

    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };

    security = {
      polkit.enable = true;
      pam.services.ags = { };
    };

    environment.systemPackages = with pkgs; [
      morewaita-icon-theme
      adwaita-icon-theme
      qogir-icon-theme
      loupe
      nautilus
      baobab
      gnome-text-editor
      gnome-calendar
      gnome-boxes
      gnome-system-monitor
      gnome-control-center
      gnome-weather
      gnome-calculator
      gnome-clocks
      wl-gammactl
      wl-clipboard
      wayshot
      pavucontrol
      brightnessctl
      swww
    ];

    systemd = {
      user.services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };

    services = {
      gvfs.enable = true;
      devmon.enable = true;
      udisks2.enable = true;
      upower.enable = true;
      accounts-daemon.enable = true;
      gnome = {
        evolution-data-server.enable = true;
        glib-networking.enable = true;
        gnome-keyring.enable = true;
        gnome-online-accounts.enable = true;
        localsearch.enable = true;
        tinysparql.enable = true;
      };
    };

    systemd.tmpfiles.rules = [
      "d '/var/cache/greeter' - greeter greeter - -"
    ];

    system.activationScripts.wallpaper =
      let
        wp = pkgs.writeShellScript "wp" ''
          CACHE="/var/cache/greeter"
          OPTS="$CACHE/options.json"
          HOME="/home/$(find /home -maxdepth 1 -printf '%f\n' | tail -n 1)"

          mkdir -p "$CACHE"

          if [[ -f "$HOME/.cache/ags/options.json" ]]; then
            cp $HOME/.cache/ags/options.json $OPTS
          fi

          if [[ -f "$HOME/.config/background" ]]; then
            cp "$HOME/.config/background" $CACHE/background
          fi
        '';
      in
      builtins.readFile wp;
  };
}

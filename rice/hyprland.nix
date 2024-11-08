{
  inputs,
  pkgs,
  ...
}:
let
  hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;
  # plugins = inputs.hyprland-plugins.packages.${pkgs.system};

  playerctl = "${pkgs.playerctl}/bin/playerctl";
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
  pactl = "${pkgs.pulseaudio}/bin/pactl";
  screenshot = import ../scripts/screenshot.nix pkgs;
in
{
  xdg.desktopEntries."org.gnome.Settings" = {
    name = "Settings";
    comment = "Gnome Control Center";
    icon = "org.gnome.Settings";
    exec = "env XDG_CURRENT_DESKTOP=gnome ${pkgs.gnome-control-center}/bin/gnome-control-center";
    categories = [ "X-Preferences" ];
    terminal = false;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland;
    systemd.enable = true;
    xwayland.enable = true;
    plugins =
      [
      ];

    settings = {
      exec-once = [
        "ags -b hypr"
        "vesktop --start-minimized"
        "firefox"
        "hyprctl setcursor Qogir 24"
      ];

      monitor = [
        # "eDP-1, 1920x1080, 0x0, 1"
        # "HDMI-A-1, 2560x1440, 1920x0, 1"
        ",preferred,auto,1"
      ];

      general = {
        layout = "dwindle";
        resize_on_border = true;
      };

      misc = {
        disable_splash_rendering = true;
        force_default_wallpaper = 1;
      };

      input = {
        kb_layout = "fr";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = "no";
          disable_while_typing = false;
          drag_lock = true;
        };
        sensitivity = 0;
        float_switch_override_focus = 2;
      };

      binds = {
        allow_workspace_cycles = true;
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
        # no_gaps_when_only = "yes";
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_use_r = true;
      };

      windowrule =
        let
          f = regex: "float, ^(${regex})$";
        in
        [
          (f "org.gnome.Calculator")
          (f "org.gnome.Nautilus")
          (f "pavucontrol")
          (f "nm-connection-editor")
          (f "blueberry.py")
          (f "org.gnome.Settings")
          (f "org.gnome.design.Palette")
          (f "Color Picker")
          (f "xdg-desktop-portal")
          (f "xdg-desktop-portal-gnome")
          (f "de.haeckerfelix.Fragments")
          (f "com.github.Aylur.ags")
          "workspace 7, title:Spotify"
          "workspace 2, title:Vesktop"
        ];

      bind =
        let
          binding =
            mod: cmd: key: arg:
            "${mod}, ${key}, ${cmd}, ${arg}";
          mvfocus = binding "SUPER" "movefocus";
          resizeactive = binding "SUPER CTRL" "resizeactive";
          mvactive = binding "SUPER ALT" "moveactive";
          swapwin = binding "SUPER SHIFT" "swapwindow";
          e = "exec, ags -b hypr";
          arr = [
            1
            2
            3
            4
            5
            6
            7
            8
            9
          ];
        in
        [
          "Super SHIFT, ampersand, movetoworkspace, 1"
          "Super SHIFT, eacute, movetoworkspace, 2"
          "Super SHIFT, quotedbl, movetoworkspace, 3"
          "Super SHIFT, apostrophe, movetoworkspace, 4"
          "Super SHIFT, parenleft, movetoworkspace, 5"
          "Super SHIFT, minus, movetoworkspace, 6"
          "Super SHIFT, egrave, movetoworkspace, 7"
          "Super SHIFT, underscore, movetoworkspace, 8"
          "Super SHIFT, ccedilla, movetoworkspace, 9"
          "Super SHIFT, agrave, movetoworkspace, 10"

          "Super, ampersand, workspace, 1"
          "Super, eacute, workspace, 2"
          "Super, quotedbl, workspace, 3"
          "Super, apostrophe, workspace, 4"
          "Super, parenleft, workspace, 5"
          "Super, minus, workspace, 6"
          "Super, egrave, workspace, 7"
          "Super, underscore, workspace, 8"
          "Super, ccedilla, workspace, 9"
          "Super, agrave, workspace, 10"
          "Super SHIFT, R, ${e} quit; ags -b hypr"
          "Super, D,       ${e} -t launcher"
          "Super, Tab,     ${e} -t overview"
          ",XF86PowerOff,  ${e} -r 'powermenu.shutdown()'"
          "Super SHIFT, s,         exec, ${screenshot}"
          "SHIFT,Print,    exec, ${screenshot} --full"
          "SUPER SHIFT, A, exec, firefox"
          "SUPER, T, exec, kitty tmux new-session -A -s main"
          "SUPER, A, exec, kitty"

          "ALT, Tab, focuscurrentorlast"
          "CTRL ALT, Delete, exit"
          "SUPER, Q, killactive"
          "SUPER, F, togglefloating"
          "SUPER SHIFT, F, fullscreen"
          "SUPER, S, fullscreen, 1"
          "SUPER shift, J, togglesplit"
          "SUPER shift, K, togglesplit"
          "SUPER shift, K, swapwindow, u"
          "SUPER, E, exec, nautilus"

          (swapwin "left" "l")
          (swapwin "down" "d")
          (swapwin "up" "u")
          (swapwin "right" "r")

          (swapwin "h" "l")
          (swapwin "j" "d")
          (swapwin "k" "u")
          (swapwin "l" "r")

          (mvfocus "j" "d")
          (mvfocus "k" "u")
          (mvfocus "l" "r")
          (mvfocus "h" "l")

          (resizeactive "k" "0 -20")
          (resizeactive "j" "0 20")
          (resizeactive "l" "20 0")
          (resizeactive "h" "-20 0")
          (mvactive "k" "0 -20")
          (mvactive "j" "0 20")
          (mvactive "l" "20 0")
          (mvactive "h" "-20 0")
          "SUPER SHIFT ALT CTRL, L, exec, firefox linkedin.com"
        ];

      bindle = [
        ",XF86MonBrightnessUp,   exec, ${brightnessctl} set +5%"
        ",XF86MonBrightnessDown, exec, ${brightnessctl} set  5%-"
        ",XF86KbdBrightnessUp,   exec, ${brightnessctl} -d asus::kbd_backlight set +1"
        ",XF86KbdBrightnessDown, exec, ${brightnessctl} -d asus::kbd_backlight set  1-"
        ",XF86AudioRaiseVolume,  exec, ${pactl} set-sink-volume @DEFAULT_SINK@ +5%"
        ",XF86AudioLowerVolume,  exec, ${pactl} set-sink-volume @DEFAULT_SINK@ -5%"
        ",XF86AudioMute,  exec, ${pactl} set-sink-mute @DEFAULT_SINK@ toggle"
      ];

      bindl = [
        ",XF86AudioPlay,    exec, ${playerctl} play-pause"
        ",XF86AudioStop,    exec, ${playerctl} pause"
        ",XF86AudioPause,   exec, ${playerctl} pause"
        ",XF86AudioPrev,    exec, ${playerctl} previous"
        ",XF86AudioNext,    exec, ${playerctl} next"
        ",XF86AudioMicMute, exec, ${pactl} set-source-mute @DEFAULT_SOURCE@ toggle"
      ];

      bindm = [
        "SUPER, mouse:273, resizewindow"
        "SUPER, mouse:272, movewindow"
      ];

      decoration = {
        shadow = {
          enabled = true;
          range = 300;
          render_power = 3;
          color = "rgba(1A1A1AAF)";
          scale = 0.9;
        };

        dim_inactive = false;

        blur = {
          enabled = true;
          size = 1;
          passes = 7;
          new_optimizations = "on";
          noise = 0.4;
          contrast = 0.8;
          brightness = 1.0;
          popups = true;
        };
      };

      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 2, myBezier"
          "windowsOut, 1, 4, default, popin 80%"
          "border, 1, 5, default"
          "fade, 1, 3, default"
          "workspaces, 1, 3, default"
        ];
      };

      plugin = {
        overview = {
          centerAligned = true;
          hideTopLayers = true;
          hideOverlayLayers = true;
          showNewWorkspace = true;
          exitOnClick = true;
          exitOnSwitch = true;
          drawActiveWorkspace = true;
          reverseSwipe = true;
        };
        hyprbars = {
          bar_color = "rgb(2a2a2a)";
          bar_height = 28;
          col_text = "rgba(ffffffdd)";
          bar_text_size = 11;
          bar_text_font = "Ubuntu Nerd Font";

          buttons = {
            button_size = 0;
            "col.maximize" = "rgba(ffffff11)";
            "col.close" = "rgba(ff111133)";
          };
        };
      };
    };
  };
}

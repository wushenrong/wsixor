# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.modules.sway.nixos = {pkgs, ...}: let
    dbus-sway-environment = pkgs.writeTextFile {
      name = "dbus-sway-environment";
      destination = "/bin/dbus-sway-environment";
      executable = true;
      text = ''
        systemctl --user stop pipewire xdg-desktop-portal xdg-desktop-portal-wlr
        systemctl --user start pipewire xdg-desktop-portal xdg-desktop-portal-wlr
      '';
    };

    configure-gtk = pkgs.writeTextFile {
      name = "configure-gtk";
      destination = "/bin/configure-gtk";
      executable = true;
      text = let
        schema = pkgs.gsettings-desktop-schemas;
        datadir = "${schema}/share/gsettings-schemas/${schema.name}";
      in ''
        export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
        gnome_schema=org.gnome.desktop.interface
        gsettings set $gnome_schema gtk-theme 'Matcha-aliz'
      '';
    };

    swayConfig = pkgs.writeText "greetd-sway-config" ''
      exec "${pkgs.greetd.regreet}/bin/regreet; swaymsg exit"
      bindsym Mod4+shift+e exec swaynag \
        -t warning \
        -m 'What do you want to do?' \
        -b 'Poweroff' 'systemctl poweroff' \
        -b 'Reboot' 'systemctl reboot'

      exec_always dbus-sway-environment
      exec_always configure-gtk

      include /etc/sway/config.d/*
    '';
  in {
    environment.systemPackages = [
      configure-gtk
      dbus-sway-environment
    ];

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.sway}/bin/sway --config ${swayConfig}";
          user = "greeter";
        };
      };
    };

    programs = {
      regreet = {
        enable = true;
        settings = {
          background = {
            path = "/home/samgo/Pictures/wallpaper.jpg";
          };
          #     commands = {
          #       reboot = ["systemctl" "reboot"];
          #       poweroff = ["systemctl" "poweroff"];
          #     };
          #   };
          #   theme = {
          #     name = "Matcha-aliz";
          #     package = pkgs.matcha-gtk-theme;
          #   };
          #   iconTheme = {
          #     name = "Papirus";
          #     package = pkgs.papirus-icon-theme;
          #   };
          #   cursorTheme = {
          #     name = "Papirus";
          #     package = pkgs.papirus-icon-theme;
        };
      };
      sway = {
        enable = true;
        wrapperFeatures.gtk = true;
      };
      waybar.enable = true;
    };
  };
}

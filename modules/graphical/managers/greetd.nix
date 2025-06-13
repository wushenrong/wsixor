# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.modules.greetd.nixos = {pkgs, ...}: let
    swayConfig = pkgs.writeText "greetd-sway-config" ''
      exec "${pkgs.greetd.gtkgreet}/bin/gtkgreet -l; swaymsg exit"

      bindsym Mod4+shift+e exec swaynag \
        -t warning \
        -m 'What do you want to do?' \
        -b 'Reboot' 'systemctl reboot'  \
        -b 'Shutdown' 'systemctl poweroff'

      set $gnome-schema org.gnome.desktop.interface

      exec_always {
        gsettings set $gnome-schema gtk-theme 'Matcha-dark-Aliz'
        gsettings set $gnome-schema icon-theme 'Papirus-Dark'
        gsettings set $gnome-schema cursor-theme 'Papirus-Dark'
        gsettings set $gnome-schema font-name 'Sans 12'
      }

      include /etc/sway/config.d/*
    '';
  in {
    # programs.regreet = {
    #   enable = true;
    #   settings = {
    #     background = {
    #       path = "/home/samgo/Pictures/wallpaper.jpg";
    #     };
    #     commands = {
    #       reboot = ["systemctl" "reboot"];
    #       poweroff = ["systemctl" "poweroff"];
    #     };
    #   };
    #   theme = {
    #     name = "Matcha-dark-aliz";
    #     package = pkgs.matcha-gtk-theme;
    #   };
    #   iconTheme = {
    #     name = "Papirus-Dark";
    #     package = pkgs.papirus-icon-theme;
    #   };
    #   cursorTheme = {
    #     name = "Papirus-Dark";
    #     package = pkgs.papirus-icon-theme;
    #   };
    # };

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.swayfx}/bin/sway --config ${swayConfig}";
          user = "greeter";
        };
      };
    };
  };
}

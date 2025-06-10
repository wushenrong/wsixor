# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.modules.greetd.nixos = {pkgs, ...}: let
    swayConfig = pkgs.writeText "greetd-sway-config" ''
      exec "${pkgs.greetd.regreet}/bin/regreet; ${pkgs.sway}/bin/swaymsg exit"

      bindsym Mod4+shift+e exec swaynag \
        -t warning \
        -m 'What do you want to do?' \
        -b 'Poweroff' 'systemctl poweroff' \
        -b 'Reboot' 'systemctl reboot'

      include /etc/sway/config.d/*
    '';
  in {
    programs.regreet = {
      enable = true;
      settings = {
        background = {
          path = "/home/samgo/Pictures/wallpaper.jpg";
        };
        commands = {
          reboot = ["systemctl" "reboot"];
          poweroff = ["systemctl" "poweroff"];
        };
      };
      theme = {
        name = "Matcha-aliz";
        package = pkgs.matcha-gtk-theme;
      };
      iconTheme = {
        name = "Papirus";
        package = pkgs.papirus-icon-theme;
      };
      cursorTheme = {
        name = "Papirus";
        package = pkgs.papirus-icon-theme;
      };
    };

    environment.systemPackages = [pkgs.sway];

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.sway}/bin/sway --config ${swayConfig}";
          user = "greeter";
        };
      };
    };
  };
}

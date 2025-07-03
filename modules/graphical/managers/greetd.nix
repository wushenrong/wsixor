# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.modules.greetd.nixos = {pkgs, ...}: let
    swayConfig = pkgs.writeText "greetd-sway-config" ''
      exec "${pkgs.greetd.regreet}/bin/regreet; swaymsg exit"

      bindsym Mod4+shift+e exec swaynag \
        -t warning \
        -m 'What do you want to do?' \
        -b 'Reboot' 'systemctl reboot'  \
        -b 'Shutdown' 'systemctl poweroff'

      include /etc/sway/config.d/*
    '';
  in {
    programs.regreet = {
      enable = true;
      settings = {
        appearance.greeting_msg = "Welcome back!"
        background = {
          path = "/home/greeter/Pictures/wallpaper.jpg";
        };
        commands = {
          reboot = ["systemctl" "reboot"];
          poweroff = ["systemctl" "poweroff"];
        };
        widget.clock = {
          format = "%F %T %Z";
        };
      };
      theme = {
        name = "Matcha-dark-aliz";
        package = pkgs.matcha-gtk-theme;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      cursorTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      font = {
        size = 14;
      };
    };

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.swayfx}/bin/sway --config ${swayConfig}";
          user = "greeter";
        };
      };
    };

    users.users.greeter = {
      home = "/home/greeter";
      createHome = true;
    };
  };
}

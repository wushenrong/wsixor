# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.modules.greetd.nixos = {pkgs, ...}: {
    programs.regreet = {
      enable = true;
      settings.commands = {
        reboot = ["systemctl" "reboot"];
        poweroff = ["systemctl" "poweroff"];
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

    services.greetd.enable = true;
  };
}

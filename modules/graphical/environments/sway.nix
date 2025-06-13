# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.modules.sway.nixos = {pkgs, ...}: {
    programs = {
      gnome-disks.enable = true;
      sway = {
        enable = true;
        wrapperFeatures.gtk = true;
        extraPackages = with pkgs; [
          brightnessctl
          eww
          grim
          nautilus
          polkit_gnome
          slurp
          swappy
          swayidle
          swaylock
          wofi
        ];
      };
      waybar.enable = true;
    };

    services.gnome.gnome-keyring.enable = true;
  };
}

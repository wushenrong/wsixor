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
      };
      waybar.enable = true;
    };

    environment.systemPackages = with pkgs; [
      eww
      nautilus
      wofi
    ];

    services.gnome.gnome-keyring.enable = true;
  };
}

# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.modules.sway.nixos = {pkgs, ...}: {
    programs = {
      gnome-disks.enable = true;
      sway = {
        enable = true;
        package = pkgs.swayfx;
        wrapperFeatures.gtk = true;
        extraPackages = with pkgs; [
          brightnessctl
          cliphist
          grim
          mako
          nautilus
          networkmanagerapplet
          slurp
          swappy
          swaybg
          swayidle
          swaylock
          wofi
        ];
      };
      waybar.enable = true;
    };

    services.gnome.gnome-keyring.enable = true;

    systemd.user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}

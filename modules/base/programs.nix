# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.modules.base.nixos = {pkgs, ...}: {
    programs = {
      nh.enable = true;
      gnupg = {
        agent.enable = true;
        dirmngr.enable = true;
      };
    };

    environment.systemPackages = with pkgs; [
      # Hardware
      pciutils
      sbctl
      usbutils

      # NixOS
      disko
      nixos-facter
      nixos-rebuild-ng

      # Additional useful packages
      elinks
      ffmpeg
      mpv
      yt-dlp
    ];
  };
}

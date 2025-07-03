# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.modules.base.nixos = {pkgs, ...}: {
    programs = {
      gnupg = {
        agent.enable = true;
        dirmngr.enable = true;
      };
      nh.enable = true;
    };

    environment.systemPackages = with pkgs; [
      # Hardware
      efibootmgr
      pciutils
      psmisc
      sbctl
      smartmontools
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

    services = {
      clamav = {
        daemon.enable = true;
        updater.enable = true;
        fangfrisch.enable = true;
      };
      fwupd.enable = true;
      geoclue2 = {
        enable = true;
        enableDemoAgent = false;
      };
      smartd.enable = true;
      tlp.enable = true;
      udisks2.enable = true;
    };
  };
}

# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.nixos = {pkgs, ...}: {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    services = {
      avahi = {
        enable = true;
        nssmdns4 = true;
        publish = {
          enable = true;
          addresses = true;
        };
      };

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

      printing = {
        enable = true;
        drivers = [pkgs.epson-escpr];
      };
    };
  };
}

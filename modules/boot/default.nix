# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{lib, ...}: {
  unify.nixos.boot = {
    initrd.systemd.enable = true;

    loader = {
      systemd-boot.enable = lib.mkDefault true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/efi";
      timeout = 3;
    };

    tmp = {
      useTmpfs = true;
      cleanOnBoot = true;
    };
  };
}

# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.modules.base.nixos = {hostConfig, ...}: {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    networking = {
      hostName = hostConfig.name;
      networkmanager.enable = true;
      nftables.enable = true;
    };

    systemd = {
      # See https://github.com/NixOS/nixpkgs/issues/180175
      services.NetworkManager-wait-online.enable = false;
      network.wait-online.enable = false;
    };
  };
}

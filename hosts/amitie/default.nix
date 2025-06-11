# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{config, ...}: {
  unify.hosts.nixos.amitie = {
    modules = with config.unify.modules; [
      base

      samgo

      graphical
      greetd
      sway

      avahi
      bluetooth
      clamav
      disko
      facter
      geoclue2
      openssh
      printing
      secure-boot
      udisks2
    ];
  };
}

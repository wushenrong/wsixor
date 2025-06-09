# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{config, ...}: {
  unify.hosts.nixos.amitie = {
    modules = with config.unify.modules; [
      base
      avahi
      bluetooth
      clamav
      disko
      facter
      geoclue
      openssh
      printing
      secure-boot
      samgo
    ];
  };
}

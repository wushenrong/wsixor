# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{config, ...}: {
  unify.hosts.nixos.amitie = {
    modules = with config.unify.modules; [
      base

      plymouth
      secure-boot

      samgo

      graphical
      greetd
      sway

      avahi
      disko
      facter
      openssh
      printing
    ];
  };
}

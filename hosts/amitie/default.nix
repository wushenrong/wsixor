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
      disko
      facter
      openssh
      printing
      secure-boot
    ];
  };
}

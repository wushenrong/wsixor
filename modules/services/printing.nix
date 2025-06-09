# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.modules.printing.nixos = {pkgs, ...}: {
    services.printing = {
      enable = true;
      drivers = [pkgs.epson-escpr];
    };
  };
}

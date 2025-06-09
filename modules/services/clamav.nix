# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.modules.clamav.nixos = {
    services.clamav = {
      daemon.enable = true;
      updater.enable = true;
      fangfrisch.enable = true;
    };
  };
}

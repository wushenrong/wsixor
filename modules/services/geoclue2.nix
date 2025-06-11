# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.modules.geoclue2.nixos = {
    location.provider = "geoclue2";
    services.geoclue2 = {
      enable = true;
      enableDemoAgent = false;
    };
  };
}

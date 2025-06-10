# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.modules.sway.nixos = {
    programs = {
      sway = {
        enable = true;
        wrapperFeatures.gtk = true;
      };
      waybar.enable = true;
    };
  };
}

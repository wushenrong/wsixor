# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0

{
  unify.nixos.security = {
    polkit.enable = true;
    rtkit.enable = true;
    sudo.execWheelOnly = true;
  };
}

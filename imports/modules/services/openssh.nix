# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0

{
  unify.modules.openssh.nixos = {
    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
      };
    };
  };
}

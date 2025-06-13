# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.modules.samgo.nixos = {pkgs, ...}: {
    users.users.samgo = {
      isNormalUser = true;
      extraGroups = [
        "input"
        "wheel"
      ];
      shell = pkgs.zsh;
      initialPassword = "CHANGE_ME";
    };

    nix.settings.trusted-users = ["samgo"];
  };
}

# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0

{
  unify.nixos = {pkgs, ...}: {
    users.users.samgo = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
      shell = pkgs.zsh;
      initialPassword = "CHANGE_ME";
    };
  };
}

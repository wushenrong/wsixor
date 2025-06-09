# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{inputs, ...}: {
  unify.modules.disko.nixos.imports = [inputs.disko.nixosModules.disko];
}

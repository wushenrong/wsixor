# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0

{inputs, ...}: {
  unify.nixos.imports = [inputs.nixos-facter-modules.nixosModules.facter];
}

# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{inputs, ...}: {
  unify.hosts.nixos.amitie.nixos = {
    imports = [inputs.nixos-hardware.nixosModules.common-cpu-intel];
    facter.reportPath = ./facter.json;
  };
}

# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0

{inputs, ...}: {
  unify.hosts.nixos.amitie.nixos = {
    facter.reportPath = ./facter.json;

    imports = with inputs.nixos-hardware.nixosModules; [
      common-cpu-intel
      common-gpu-intel
    ];
  };
}

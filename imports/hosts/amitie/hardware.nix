{inputs, ...}: {
  unify.hosts.nixos.amitie.nixos = {
    facter.reportPath = ./facter.json;

    imports = with inputs.nixos-hardware.nixosModules; [
      common-cpu-intel
      common-gpu-intel
    ];
  };
}

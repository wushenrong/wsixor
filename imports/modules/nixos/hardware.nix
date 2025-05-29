{inputs, ...}: {
  unify.nixos.imports = [
    inputs.nixos-facter-modules.nixosModules.facter
    inputs.disko.nixosModules.disko
  ];
}

{inputs, ...}: {
  flake.modules.nixos.facter.imports = [
    inputs.nixos-facter-modules.nixosModules.facter
  ];
}

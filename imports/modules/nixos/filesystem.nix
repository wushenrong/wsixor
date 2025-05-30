{inputs, ...}: {
  unify.nixos.imports = [inputs.disko.nixosModules.disko];
}

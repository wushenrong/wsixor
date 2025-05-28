{inputs, ...}: {
  flake.modules.nixos.lix.imports = [
    inputs.lix-module.nixosModules.default
  ];
}

{inputs, ...}: {
  flake.modules.nixos.nix-ld.imports = [inputs.nix-ld.nixosModules.nix-ld];
}

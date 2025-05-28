{
  inputs,
  lib,
  ...
}: let
  flake.nixosConfigurations = {
    amitie = linux "amitie";
  };

  linux = mkNixOS "x86_64-linux" "nixos";

  mkNixOS = system: cls: name:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        inputs.self.modules.nixos.${cls}
        inputs.self.modules.nixos.${name}
        inputs.self.modules.nixos.${system}
        {
          networking.hostName = lib.mkDefault name;
          nixpkgs.hostPlatform = lib.mkDefault system;
          system.stateVersion = "25.05";
        }
      ];
    };
in {
  inherit flake;
}

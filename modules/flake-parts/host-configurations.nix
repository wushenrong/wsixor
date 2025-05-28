{
  inputs,
  lib,
  config,
  flake-parts-lib,
  ...
}: let
  inherit (lib) mkOption types;
  inherit (flake-parts-lib) mkSubmoduleOptions;
  hosts = config.flake.hosts or {};
  # flake.nixosConfigurations = {
  #   amitie = linux "amitie";
  # };
  # linux = mkNixOS "x86_64-linux" "nixos";
  # mkNixOS = system: cls: name:
  #   inputs.nixpkgs.lib.nixosSystem {
  #     inherit system;
  #     modules = [
  #       inputs.self.modules.nixos.${cls}
  #       inputs.self.modules.nixos.${name}
  #       inputs.self.modules.nixos.${system}
  #       {
  #         networking.hostName = lib.mkDefault name;
  #         nixpkgs.hostPlatform = lib.mkDefault system;
  #         system.stateVersion = "25.05";
  #       }
  #     ];
  #   };
in {
  options = {
    flake = mkSubmoduleOptions {
      hosts = mkOption {
        type = types.lazyAttrsOf types.unspecified;
        default = {};
      };
    };
  };

  config = {
    flake.nixosConfigurations = lib.pipe hosts [
      (lib.mapAttrs' (
        name: host: {
          name = name;
          value = inputs.nixpkgs.lib.nixosSystem {
            modules =
              (builtins.attrValues host.modules)
              ++ [
                {
                  networking.hostName = name;
                }
              ];
          };
        }
      ))
    ];
  };
}

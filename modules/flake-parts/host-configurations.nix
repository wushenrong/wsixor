{
  inputs,
  lib,
  flake-parts-lib,
  config,
  ...
}: let
  inherit (lib) mkOption types;
  inherit (flake-parts-lib) mkSubmoduleOptions;
  hosts = config.flake.hosts or {};
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
                  networking = {
                    hostName = name;
                  };
                }
              ];
          };
        }
      ))
    ];
  };
}

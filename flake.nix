# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: 0BSD
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    systems.url = "github:nix-systems/default";

    # Better management with flake modules
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    # Automatic disk partitioning
    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    # Use lix instead of nix as package manager
    lix-module.url = "https://git.lix.systems/lix-project/nixos-module/archive/2.93.0.tar.gz";
    lix-module.inputs.nixpkgs.follows = "nixpkgs";

    # Patch generic linux executables to run on NixOS
    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);

  # Simple Shearable Config
  # From https://www.reddit.com/r/NixOS/comments/yk4n8d/comment/iurkkxv
  # outputs = {
  #   nix-ld,
  #   nixpkgs,
  #   lix-module,
  #   ...
  # } @ attrs: let
  #   commonModules = name: [
  #     nix-ld.nixosModules.nix-ld
  #     lix-module.nixosModules.default
  #     ./configuration.nix
  #     ./hosts/${name}
  #     {
  #       networking.hostName = name;
  #       programs.nix-ld.dev.enable = true;
  #     }
  #   ];
  #   mkSystem = name: cfg:
  #     nixpkgs.lib.nixosSystem {
  #       system = cfg.system or "x86_64-linux";
  #       modules = (commonModules name) ++ (cfg.modules or []);
  #       specialArgs = attrs;
  #     };
  #   systems = {
  #     amitie = {};
  #   };
  # in {
  #   nixosConfigurations = nixpkgs.lib.mapAttrs mkSystem systems;
  # };
}

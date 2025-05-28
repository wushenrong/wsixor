# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT
{
  inputs = {
    # Use stable instead of unstable packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # Better management with flake modules
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    # Automatic disk partitioning
    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    # Hardware configuration
    systems.url = "github:nix-systems/default";
    nixos-facter-modules.url = "github:numtide/nixos-facter-modules";

    # Use lix instead of nix as package manager
    lix-module.url = "https://git.lix.systems/lix-project/nixos-module/archive/2.93.0.tar.gz";
    lix-module.inputs.nixpkgs.follows = "nixpkgs";

    # Patch generic linux executables to run on NixOS
    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";

    # Modularize mkShell
    make-shell.url = "github:nicknovitski/make-shell";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);
}

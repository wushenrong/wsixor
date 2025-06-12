# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{inputs, ...}: {
  unify.nixos = {
    imports = [
      inputs.lix-module.nixosModules.default
      inputs.nix-index-database.nixosModules.nix-index
      inputs.nix-ld.nixosModules.nix-ld
    ];
    programs.nix-index-database.comma.enable = true;

    nixpkgs.config.allowUnfree = true;

    nix = {
      channel.enable = false;
      optimise = {
        automatic = true;
        dates = ["weekly"];
      };
      gc = {
        automatic = true;
        dates = "weekly";
      };
      nixPath = ["nixpkgs=${inputs.nixpkgs}"];
      settings = {
        auto-optimise-store = true;
        trusted-users = ["root"];
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
    };
  };
}

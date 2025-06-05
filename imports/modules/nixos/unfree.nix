# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0

{
  lib,
  config,
  ...
}: {
  unify = let
    predicate = pkg: builtins.elem (lib.getName pkg) config.nixpkgs.allowedUnfreePackages;
  in {
    nixos = {
      nixpkgs.config.allowUnfreePredicate = predicate;
    };
  };
}

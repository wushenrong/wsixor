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

{inputs, ...}: {
  imports = [inputs.make-shell.flakeModules.default];

  unify.nixos = {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep 3";
    };
  };

  perSystem = {pkgs, ...}: {
    make-shells.default.packages = [pkgs.nh];
  };
}

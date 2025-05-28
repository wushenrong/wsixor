{
  flake.modules = {
    nixos.printing = {pkgs, ...}: {
      services.printing.enable = true;
      services.printing.drivers = builtins.attrValues {
        inherit (pkgs) epson-escpr;
      };
    };
  };
}

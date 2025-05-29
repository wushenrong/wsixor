{inputs, ...}: {
  unify = {
    nixos = {
      imports = [
        inputs.lix-module.nixosModules.default
        inputs.nix-ld.nixosModules.nix-ld
      ];

      nixpkgs.config.allowUnfree = true;

      nix = {
        gc.automatic = true;
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
  };
}

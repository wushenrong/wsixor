{inputs, ...}: {
  unify.nixos = {
    imports = [
      inputs.lix-module.nixosModules.default
      inputs.nix-ld.nixosModules.nix-ld
    ];

    nixpkgs.config.allowUnfree = true;

    nix = {
      settings = {
        auto-optimise-store = true;
        trusted-users = [
          "root"
          "samgo"
        ];
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
    };
  };
}

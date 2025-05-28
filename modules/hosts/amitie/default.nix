{config, ...}: {
  flake.hosts.amitie = {
    modules = {
      inherit
        (config.flake.modules.nixos)
        facter
        lix
        nix-ld
        ;
    };
  };
}

{config, ...}: {
  flake.hosts.amitie = {
    modules = {
      inherit
        (config.flake.modules.nixos)
        amitie
        disko
        facter
        lix
        nix-ld
        ;
    };
  };
}

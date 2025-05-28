{config, ...}: {
  flake.hosts.amitie = {
    modules = {
      inherit
        (config.flake.modules.nixos)
        base
        amitie
        avahi
        bluetooth
        disko
        facter
        lix
        nix-ld
        openssh
        pipewire
        printing
        shell
        ;
    };
  };
}

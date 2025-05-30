{config, ...}: {
  unify.hosts.nixos.amitie = {
    modules = with config.unify.modules; [
      openssh
      secure-boot
    ];
  };
}

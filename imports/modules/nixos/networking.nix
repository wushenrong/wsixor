{
  unify.nixos = {hostConfig, ...}: {
    networking = {
      hostName = hostConfig.name;
      networkmanager.enable = true;
      nftables.enable = true;
    };
  };
}

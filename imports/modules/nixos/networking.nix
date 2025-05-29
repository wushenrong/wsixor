{
  unify.nixos = {hostConfig, ...}: {
    networking = {
      hostName = hostConfig.name;
      networkmanager.enable = true;
      nftables.enable = true;
    };

    # See https://github.com/NixOS/nixpkgs/issues/180175
    systemd.services.NetworkManager-wait-online.enable = false;
    systemd.network.wait-online.enable = false;
  };
}

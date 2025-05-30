{
  unify.nixos.systemd = {
    # See https://github.com/NixOS/nixpkgs/issues/180175
    services.NetworkManager-wait-online.enable = false;
    network.wait-online.enable = false;
  };
}

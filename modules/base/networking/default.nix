{
  flake.modules = {
    nixos.base = {
      networking.networkmanager.enable = true;
      networking.nftables.enable = true;
    };
  };
}

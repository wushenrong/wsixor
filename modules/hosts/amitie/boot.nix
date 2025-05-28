{
  flake.modules.nixos.amitie.boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.efi.efiSysMountPoint = "/efi";
  };
}

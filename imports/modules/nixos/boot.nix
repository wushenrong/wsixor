{lib, ...}: {
  unify.nixos.boot = {
    initrd.systemd.enable = true;

    loader = {
      systemd-boot.enable = lib.mkDefault true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/efi";
    };

    tmp = {
      useTmpfs = true;
      cleanOnBoot = true;
    };
  };
}

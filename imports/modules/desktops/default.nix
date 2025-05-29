{
  unify.modules.desktop.nixos = {pkgs, ...}: {
    programs.dconf.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    environment = {
      systemPackages = [pkgs.wl-clipboard];
      sessionVariables.NIXOS_OZONE_WL = "1";
    };
  };
}

{
  unify.modules.graphical.nixos = {pkgs, ...}: {
    environment = {
      systemPackages = [pkgs.wl-clipboard];
      sessionVariables.NIXOS_OZONE_WL = "1";
    };

    fonts ={
      enableDefaultPackages = true;
      packages = [pkgs.cascadia-code];
    };

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}

# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.modules.graphical.nixos = {pkgs, ...}: {
    programs = {
      dconf.enable = true;
      firefox.enable = true;
    };

    environment = {
      sessionVariables.NIXOS_OZONE_WL = "1";
      systemPackages = with pkgs; [
        kitty
        matcha-gtk-theme
        papirus-icon-theme
        wl-clipboard
        xdg-user-dirs
      ];
    };

    fonts = {
      enableDefaultPackages = true;
      packages = [pkgs.cascadia-code];
    };

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    xdg.portal.enable = true;
  };
}

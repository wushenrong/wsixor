# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.modules.graphical.nixos = {pkgs, ...}: {
    programs = {
      dconf.enable = true;
      firefox.enable = true;
      gamemode.enable = true;
      steam = {
        enable = true;
        extraCompatPackages = [pkgs.proton-ge-bin];
      };
    };

    environment = {
      sessionVariables = {
        NIXOS_OZONE_WL = "1";
        # Use OpenGL instead of Vulkan for GTK4 due to possabily a Mesa
        # regression
        # https://discourse.nixos.org/t/regreet-shows-up-with-a-white-screen-after-booting/65490
        GSK_RENDERER = "ngl";
      };
      systemPackages = with pkgs; [
        adwaita-icon-theme
        discord
        glib
        kitty
        matcha-gtk-theme
        papirus-icon-theme
        pwvucontrol
        vscode.fhs
        wl-clipboard
        xdg-user-dirs

        # Utilities
        libva-utils
        mesa-demos
        vulkan-tools
      ];
    };

    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        cascadia-code
        font-awesome
        nerd-fonts.symbols-only
      ];
    };

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };
  };
}

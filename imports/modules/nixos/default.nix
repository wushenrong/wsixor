{
  unify.nixos = {
    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "America/New_York";
    location.provider = "geoclue2";

    # https://mastodon.online/@nomeata/109915786344697931
    documentation.nixos.enable = false;

    system.rebuild.enableNg = true;
    system.autoUpgrade = {
      enable = true;
      dates = "daily";
      flake = "github:wushenrong/wsixor";
      allowReboot = true;
    };

    system.stateVersion = "25.05";
  };
}

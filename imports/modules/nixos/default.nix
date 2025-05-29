{
  unify.nixos = {
    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "America/New_York";
    location.provider = "geoclue2";

    system.stateVersion = "25.05";
    system.rebuild.enableNg = true;
  };
}

{
  flake.modules = {
    nixos.base = {
      i18n.defaultLocale = "en_US.UTF-8";
      i18n.defaultCharset = "UTF-8";
    };
  };
}

{
  flake.modules = {
    nixos.avahi = {
      services.avahi = {
        enable = true;
        nssmdns4 = true;
        publish = {
          enable = true;
          addresses = true;
        };
      };
    };
  };
}

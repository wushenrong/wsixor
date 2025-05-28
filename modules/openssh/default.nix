{
  flake.modules = {
    nixos.openssh = {
      services.openssh = {
        enable = true;
        settings = {
          PermitRootLogin = "no";
        };
      };
    };
  };
}

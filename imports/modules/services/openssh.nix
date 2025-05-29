{
  unify.modules.openssh.nixos = {
    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
      };
    };
  };
}

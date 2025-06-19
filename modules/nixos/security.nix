{
  unify.nixos.security = {
    polkit.enable = true;
    rtkit.enable = true;
    sudo = {
      # No options for default rules
      defaultOptions = [];
      execWheelOnly = true;
      extraConfig = ''
        Defaults editor=/usr/bin/rnano, !env_editor
      '';
    };
  };
}

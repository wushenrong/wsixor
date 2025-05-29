{
  unify.nixos.security = {
    polkit.enable = true;
    rtkit.enable = true;

    sudo.execWheelOnly = true;
  };
}

{
  flake.modules = {
    nixos.base = {
      security.sudo.execWheelOnly = true; # Only the wheel group can use sudo
    };
  };
}

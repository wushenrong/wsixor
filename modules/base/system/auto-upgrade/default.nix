{
  flake.modules = {
    nixos.base = {
      system.autoUpgrade = {
        enable = true;
        dates = "daily";
        flake = "github:wushenrong/wsixor";
        allowReboot = true;
      };
    };
  };
}

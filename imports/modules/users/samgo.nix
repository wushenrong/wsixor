{
  unify.nixos = {pkgs, ...}: {
    users.users.samgo = {
      isNormalUser = true;
      createHome = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
      shell = pkgs.zsh;
      initialPassword = "CHANGE_ME";
    };
  };
}

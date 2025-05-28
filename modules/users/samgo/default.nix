{config, ...}: {
  flake = {
    meta.users = {
      samgo = {
        email = "twopizza9621536@gmail.com";
        name = "Samuel Wu";
        username = "samgo";
      };
    };

    modules.nixos.base = {pkgs, ...}: {
      programs.zsh.enable = true;

      users.users.samgo = {
        description = config.flake.meta.users.samgo.name;
        isNormalUser = true;
        createHome = true;
        extraGroups = [
          "audio"
          "input"
          "networkmanager"
          "sound"
          "tty"
          "video"
          "wheel"
        ];
        shell = pkgs.zsh;
        initialPassword = "CHANGE_ME";
      };

      nix.settings.trusted-users = [config.flake.meta.users.samgo.name];
    };
  };
}

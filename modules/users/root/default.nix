{
  flake.modules = {
    nixos.base = {
      users.users.root = {
        initialPassword = "DISABLE_AND_LOCK_ME";
      };
    };
  };
}

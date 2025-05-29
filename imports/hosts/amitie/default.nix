{
  inputs,
  config,
  ...
}: {
  unify.hosts.nixos.amitie = {
    modules = builtins.attrValues {
      inherit (config.unify.modules) openssh;
    };

    # tags = [
    #   #  "base"
    #   #  "avahi"
    #   #  "cli"
    #   "openssh"
    #   #  "printing"
    # ];

    nixos = {
      facter.reportPath = ./facter.json;

      imports = builtins.attrValues {
        inherit
          (inputs.nixos-hardware.nixosModules)
          common-cpu-intel
          common-gpu-intel
          ;
      };

      disko.devices = {
        disk = {
          main = {
            device = "/dev/sda";
            type = "disk";
            content = {
              type = "gpt";
              partitions = {
                ESP = {
                  type = "EF00";
                  size = "512M";
                  content = {
                    type = "filesystem";
                    format = "vfat";
                    mountpoint = "/efi";
                    mountOptions = ["umask=0077"];
                  };
                };
                root = {
                  end = "-8G";
                  content = {
                    type = "filesystem";
                    format = "ext4";
                    mountpoint = "/";
                  };
                };
                swap = {
                  size = "100%";
                  content = {
                    type = "swap";
                    discardPolicy = "both";
                    resumeDevice = true;
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}

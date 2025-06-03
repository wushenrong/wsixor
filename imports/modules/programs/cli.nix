{inputs, ...}: {
  unify.nixos = {pkgs, ...}: {
    imports = [inputs.nix-index-database.nixosModules.nix-index];
    programs.nix-index-database.comma.enable = true;

    programs = {
      bat.enable = true;
      ccache.enable = true;
      git.enable = true;
      gnupg = {
        agent.enable = true;
        dirmngr.enable = true;
      };
      less.enable = true;
      tmux.enable = true;
      vim.enable = true;
      yazi.enable = true;
      zoxide.enable = true;
      zsh.enable = true;
    };

    environment.systemPackages = with pkgs; [
      # Useful system utilities
      curl
      file
      libarchive
      pciutils
      sbctl
      usbutils
      wget

      # Nix
      inputs.nix-alien.packages.${system}.default
      inputs.nix-inspect.packages.${system}.default
      nix-output-monitor
      nix-tree
      nixos-rebuild-ng

      # Utilities for shell setup
      bfs
      btop
      chafa
      chezmoi
      delta
      duf
      elinks
      eza
      fastfetch
      fd
      ffmpeg
      fzf
      gdu
      glow
      hexyl
      hyperfine
      imagemagick
      jq
      lesspipe
      mediainfo
      mpv
      ripgrep
      tokei
      vivid
      yt-dlp

      # Spellchecker
      hunspell
      hunspellDicts.en_US
    ];
  };
}

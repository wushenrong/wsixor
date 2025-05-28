{
  flake.modules = {
    nixos.shell = {
      programs = {
        bat.enable = true;
        ccache.enable = true;
        git.enable = true;
        less.enable = true;
        nano.enable = true;
        tmux.enable = true;
        vim.enable = true;
        zoxide.enable = true;
        zsh.enable = true;
        # Some programs need SUID wrappers, can be configured further or are
        # started in user sessions.
        gnupg = {
          agent.enable = true;
          dirmngr.enable = true;
        };
      };
    };

    environment.systemPackages = {pkgs, ...}:
      builtins.attrValues {
        inherit
          (pkgs)
          aspell
          bfs
          btop
          chafa
          chezmoi
          curl
          delta
          duf
          elinks
          exiftool
          eza
          fastfetch
          fd
          file
          fzf
          gdu
          glow
          hexyl
          hyperfine
          imagemagick
          jq
          lesspipe
          ripgrep
          shellcheck
          shfmt
          tokei
          vivid
          wget
          ;
      };
  };
}

# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{inputs, ...}: {
  unify.nixos = {pkgs, ...}: {
    programs = {
      bat.enable = true;
      git.enable = true;
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
      libarchive
      file
      wget

      # Utilities for shell setup
      bfs
      btop
      chafa
      chezmoi
      delta
      duf
      eza
      fastfetch
      fd
      fzf
      gdu
      glow
      hexyl
      hyperfine
      imagemagick
      jq
      lesspipe
      mediainfo
      ripgrep
      tokei
      vivid

      # Spellchecker
      hunspell
      hunspellDicts.en_US

      # Nix
      inputs.nix-alien.packages.${system}.default
      inputs.nix-inspect.packages.${system}.default
      nix-output-monitor
      nix-tree
    ];
  };
}

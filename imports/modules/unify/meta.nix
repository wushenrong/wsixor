# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0

{lib, ...}: {
  options.flake.meta = lib.mkOption {
    type = with lib.types; lazyAttrsOf anything;
  };

  config.flake.meta.uri = "github:wushenrong/wsixor";
}

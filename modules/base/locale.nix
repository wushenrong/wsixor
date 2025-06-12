# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT-0
{
  unify.modules.base.nixos = {
    i18n.defaultLocale = "en_US.UTF-8";
    location.provider = "geoclue2";
    time.timeZone = "America/New_York";
  };
}

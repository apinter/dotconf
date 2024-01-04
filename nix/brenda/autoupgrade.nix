{ config, lib, pkgs, ... }:

{
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "daily";
  system.autoUpgrade.persistent = true;
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-23.11-small";
  system.autoUpgrade.allowReboot = true;
  system.autoUpgrade.rebootWindow = {
      lower = "03:00";
      upper = "05:00";
    };
  system.autoUpgrade.randomizedDelaySec = "15min";
}

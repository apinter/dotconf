{ config, lib, pkgs, ... }:

{
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "daily";
  system.autoUpgrade.persistent = true;
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-23.11";
  system.autoUpgrade.allowReboot = false;
  system.autoUpgrade.randomizedDelaySec = "15min";
}
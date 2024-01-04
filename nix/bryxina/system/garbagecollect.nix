{ config, lib, pkgs, ... }:

{
  nix.gc.automatic = true;
  nix.gc.persistent = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 5d";
  nix.gc.randomizedDelaySec = "30m";
}
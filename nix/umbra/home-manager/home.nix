{ config, pkgs, ... }:

{
  home.username = "apinter";
  home.homeDirectory = "/home/apinter";
  home.stateVersion = "23.05";
  
  home.packages = with pkgs; [
      htop
      grc
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      font-awesome
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese
      kitty
      kitty-themes
      openssl
  ];

  imports = [
    ./apps/fish.nix
    #./apps/gnome-keyring.nix
  ];

}

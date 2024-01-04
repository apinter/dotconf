{ config, pkgs, callPackage, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./monitoring/node-exporter.nix
      ./systemd-user/flatpak-auto-update.nix
      # ./print/printer.nix
      ./hardware/accel.nix
      ./containers/containers.nix
      ./system/garbagecollect.nix
      ./system/autoupgrade.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  security.rtkit.enable = true;
  zramSwap.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  networking.hostName = "throtur";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Jakarta";

  users.users.throtur = {
    initialPassword = "pw123";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
  
  users.users.apinter = {
    isNormalUser = true;
    home = "/home/apinter";
    description = "Attila Pinter";
    extraGroups = [ "wheel" "devops" ];
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICACL0UUvhrkRty9z3mv629Qg+v3AVt6G8mlMVj9iBE/ Attila Pinter" ];
  };
  
  security.sudo.extraRules = [
    {
      groups = [ "devops" ];
      commands = [ { command = "ALL"; options = [ "NOPASSWD" ]; } ];
    }
  ];
  
  users.groups.devops.gid = 5000;

  environment.systemPackages = with pkgs; [
    ark
    xfce.thunar-archive-plugin
    zip
    unzip
    albert
    bash
    vim
    mesa
    glxinfo
    wineWowPackages.stable
    winetricks
    wget
    curl
    ranger
    nfs-utils
    git
    firefox
    policycoreutils
    python3
    distrobox
    xfce.xfce4-whiskermenu-plugin
    xorg.xhost
    gnome.gnome-keyring
    xfce.xfce4-volumed-pulse
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-timer-plugin
    xfce.xfce4-notes-plugin
    conmon
    crun
    slirp4netns
    su
    microsoft-edge
    gnome.gnome-disk-utility
  ];

  hardware.opengl.enable = true; 
  hardware.opengl.extraPackages = [ pkgs.mesa.drivers ];
  hardware.opengl.driSupport32Bit = true;
  services.openssh.enable = true;
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [ pkgs.sane-backends ];
  networking.firewall.enable = false;
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
    displayManager.defaultSession = "xfce";
  };   

  services.flatpak.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings = {
        dns_enabled = true;
      };
    };
  };
  virtualisation.oci-containers.backend = "podman";
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.lightdm.enableGnomeKeyring = true;

  fileSystems."/home/throtur/Common" = {
      device = "172.168.1.3:/shirayuki/Common";
      fsType = "nfs";
  };

  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" ];
  };

  fileSystems."/home/throtur/Reno" = {
      device = "172.168.1.3:/shirayuki/Home/apinter_jr";
      fsType = "nfs";
  };
  fileSystems."/home/throtur/VMs" = {
      device = "/dev/disk/by-uuid/4cca616f-6396-4baa-9370-a2b345b9c57c";
      fsType = "btrfs";
      options = [ "compress=zstd:1" ];
  };

  nixpkgs.config.allowUnfree = true;  
  system.stateVersion = "23.05"; 
}

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./zfs_pool.nix
      ./autoupgrade.nix
      ./monitoring.nix
      ./exports.nix 
    ];

  boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "/dev/sde" ];
  boot.loader.grub.zfsSupport = true;
  boot.loader.grub.memtest86.enable = true;
  boot.loader.grub.efiSupport = false;
  security.rtkit.enable = true;

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
  networking.hostName = "brenda";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Jakarta";

  services.xserver.xkb.layout = "us";
  services.xserver.xkb.options = "eurosign:e,caps:escape";

  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportAll = false;
  networking.hostId = "d1a3152c";
  services.nfs.server = {
    enable = true;
  };

  users.users.apinter = {
    isNormalUser = true;
    home = "/home/apinter";
    description = "Attila Pinter";
    extraGroups = [ "wheel" "devops" ];
    openssh.authorizedKeys.keys = [ "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIMx2FC01/IaD/NxAmmz01/uyaSWMvI+Sy0EGP9JpS40TAAAABHNzaDo= kazeshini-31-07-2022)-yubikey1" ];
  };

  security.sudo.extraRules = [
    {
      groups = [ "devops" ];
      commands = [ { command = "ALL"; options = [ "NOPASSWD" ]; } ];
    }
  ];
  
  users.groups.devops.gid = 5000;

  environment.systemPackages = with pkgs; [
    vim 
    wget
    htop
    cryptsetup
  ];

  services.openssh.enable = true;
  networking.firewall.enable = false;
  zramSwap.enable = true;
  services.zfs.trim.enable = true;
  services.zfs.autoScrub.enable = true;
  services.zfs.autoScrub.interval = "Sun, 01:00";
  services.zfs.autoSnapshot.daily = 7;
  services.zfs.autoSnapshot.weekly = 4;
  services.zfs.autoSnapshot.monthly = 12;

  system.stateVersion = "23.11";

}


{ config, pkgs, callPackage, ... }:
{
  #nixpkgs.config.pulseaudio = true;

  ## Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  security.rtkit.enable = true;
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

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      #./systemd-root/node-exporter.nix
      ./monitoring/node-exporter.nix
      ./systemd-user/flatpak-auto-update.nix
      ./print/printer.nix
      ./hardware/accel.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  networking.hostName = "sofie"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Define a user account. Don't forget to set a password with ‘passwd’.
users.users.sofie = {
  initialPassword = "pw123";
  isNormalUser = true;
  extraGroups = [ "wheel" "scanner" "lp" ]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     firefox
  #     thunderbird
  #   ];
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

  # List packages installed in system profile. To search, run:
  # $ nix search wget
 environment.systemPackages = with pkgs; [
   bash
   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   wget
   curl
   ranger
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
   mesa
   glxinfo
   wineWowPackages.stable
   winetricks
];

 hardware. opengl. enable = true; 
 hardware.opengl.extraPackages = [ pkgs.mesa.drivers ];
 hardware.opengl.driSupport32Bit = true;
  # Enable the OpenSSH daemon.
 services.openssh.enable = true;
  # Scanner 
 hardware.sane.enable = true;
 hardware.sane.extraBackends = [ pkgs.sane-backends ];
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 25565 ];
  # networking.firewall.allowedUDPPorts = [ 25565 ];
  # Or disable the firewall altogether.
 zramSwap.enable = true;
 networking.firewall.enable = false;
 fileSystems."/home/sofie/Common" = {
    device = "172.168.1.3:/shirayuki/Common";
    fsType = "nfs";
 };

 fileSystems."/home/sofie/Reno" = {
    device = "172.168.1.3:/shirayuki/Home/sofie";
    fsType = "nfs";
 };
 services.blueman.enable = true;
 hardware.bluetooth.enable = true;
  
  system.stateVersion = "23.05"; # Did you read the comment?

}

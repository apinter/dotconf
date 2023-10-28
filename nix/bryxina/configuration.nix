{ config, pkgs, callPackage, ... }:
{
  #nixpkgs.config.pulseaudio = true;
  zramSwap.enable = true;
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
      ./systemd-user/flatpak-auto-update.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "bryxina";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Enable CUPS to print documents.
  # services.printing.enable = true;
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.printing.drivers = [ pkgs.gutenprint ];
  # for a WiFi printer
  services.avahi.openFirewall = true;
  services.avahi.publish.enable = true;
  services.avahi.publish.userServices = true;
  services.printing.browsing = true;
  services.printing.listenAddresses = [ "*:631" ];
  services.printing.allowFrom = [ "all" ];
  services.printing.defaultShared = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
users.users.bryxina = {
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
   mesa
   glxinfo
   wineWowPackages.stable
   winetricks

];

  # List services that you want to enable:
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
 networking.firewall.enable = false;
 fileSystems."/home/bryxina/Common" = {
    device = "172.168.1.3:/shirayuki/Common";
    fsType = "nfs";
 };

 fileSystems."/home/bryxina/Reno" = {
    device = "172.168.1.3:/shirayuki/Home/skye";
    fsType = "nfs";
 };

  system.stateVersion = "23.05"; # Did you read the comment?

}

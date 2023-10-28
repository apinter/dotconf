{ config, pkgs, callPackage, ... }:

## Sway configuration 
let
  # bash script to let dbus know about important env variables and
  # propagate them to relevent services run at the end of sway config
  # see
  # https://github.com/emersion/xdg-desktop-portal-wlr/wiki/"It-doesn't-work"-Troubleshooting-Checklist
  # note: this is pretty much the same as  /etc/sway/config.d/nixos.conf but also restarts  
  # some user services to make sure they have the correct environment variables
  dbus-sway-environment = pkgs.writeTextFile {
    name = "dbus-sway-environment";
    destination = "/bin/dbus-sway-environment";
    executable = true;

    text = ''
      dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
      systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
      systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
    '';
  };

  # currently, there is some friction between sway and gtk:
  # https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland
  # the suggested way to set gtk settings is with gsettings
  # for gsettings to work, we need to tell it where the schemas are
  # using the XDG_DATA_DIR environment variable
  # run at the end of sway config
  configure-gtk = pkgs.writeTextFile {
    name = "configure-gtk";
    destination = "/bin/configure-gtk";
    executable = true;
    text = let
      schema = pkgs.gsettings-desktop-schemas;
      datadir = "${schema}/share/gsettings-schemas/${schema.name}";
    in ''
      export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
      gnome_schema=org.gnome.desktop.interface
      gsettings set $gnome_schema gtk-theme 'Dracula'
    '';
  };


in
{
  environment.systemPackages = with pkgs; [
    alacritty # gpu accelerated terminal
    pulseaudio
    pavucontrol
    dbus-sway-environment
    configure-gtk
    wayland
    waybar
    wofi
    xdg-utils # for opening default programs when clicking links
    glib # gsettings
    dracula-theme # gtk theme
    gnome3.adwaita-icon-theme  # default gnome cursors
    swaylock
    swayidle
    grim # screenshot functionality
    slurp # screenshot functionality
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    bemenu # wayland clone of dmenu
    mako # notification system developed by swaywm maintainer
    wdisplays # tool to configure displays
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    just
    ranger
    screen
    git
    policycoreutils
    python3
    distrobox
    xorg.xhost
    gnome.gnome-keyring
    conmon
    crun
    slirp4netns
    su
    distrobox
    skopeo
    buildah
    gnupg
    yubikey-personalization
    wireguard-tools
    cryfs
    gnome.nautilus
    mesa
    glxinfo
  ];

  fonts.fonts =  with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "ShareTechMono" ]; })
  ];

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
      ./systemd-user/flatpak-auto-update.nix
      #./networking/wg.nix
      # ./print/printer.nix
    ];

  ## Grub configuration
  boot.loader.efi.canTouchEfiVariables = true;
  
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    enableCryptodisk = true;
  };
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-uuid/a9633d06-26b8-44c2-ae1b-9041a9fdd85b";
    };
  };

  ## Network configuration
  networking.hostName = "umbra";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  ## Enalbe hw accelerated video decoding
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  ## Enable pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  ## User configuration
  users.users.apinter = {
    isNormalUser = true;
    home = "/home/apinter";
    initialPassword = "pw123";
    description = "Attila Pinter";
    extraGroups = [ "wheel" "devops" "docker" "scanner" "lp" ];
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICACL0UUvhrkRty9z3mv629Qg+v3AVt6G8mlMVj9iBE/ Attila Pinter" ];
  };

  users.groups.devops.gid = 5000;

  ## Use sudo without password
  security.sudo.extraRules = [
    {
      groups = [ "devops" ];
      commands = [ { command = "ALL"; options = [ "NOPASSWD" ]; } ];
    }
  ];

  ## Home-manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.apinter = import ./home-manager/home.nix;
  };


  ## Enable sway
  # enable sway window manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  programs.light.enable = true;

  programs.sway.extraSessionCommands = ''
    export GNOME_KEYRING_CONTROL=/run/user/$UID/keyring
    export SSH_AUTH_SOCK=/run/user/$UID/keyring/ssh
  '';


  ## Enable flatpaks
  services.flatpak.enable = true;

  ## Enable podman
  virtualisation = {
    podman = {
      enable = true;
      defaultNetwork.settings = {
        dns_enabled = true;
      };
    };
  };
  virtualisation.oci-containers.backend = "podman";
  services.gnome.gnome-keyring.enable = true;

  #security.pam.services.lightdm.enableGnomeKeyring = true;
  security.pam.services.swaylock.text = ''
    # PAM configuration file for the swaylock screen locker. By default, it includes
    # the 'login' configuration file (see /etc/pam.d/login)
    auth include login
  '';

  ## Enable Docker 
  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";
  
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
 hardware. opengl. enable = true; 
 hardware.opengl.extraPackages = [ pkgs.mesa.drivers ];
 hardware.opengl.driSupport32Bit = true;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 22 ];
    allowedUDPPortRanges =  [ ];
    allowedUDPPorts = [ 51820 ];
  };

  environment.etc."sway/config.d/custom.conf" = {
    text = ''
      # screenshots
      bindsym $mod+c exec grim  -g "$(slurp)" /tmp/$(date +'%H:%M:%S.png')

      exec dbus-sway-environment
      exec configure-gtk

  '';

    # The UNIX file mode bits
    mode = "0666";
  };

  environment.etc."sway/config" = {
    mode = "0666";
    source = ./sway/config;
  };


  environment.etc."sway/config.d/50-openSUSE.conf" = {
    mode = "0666";
    source = ./sway/config.d/50-openSUSE.conf;
  };

  system.stateVersion = "23.05";

}

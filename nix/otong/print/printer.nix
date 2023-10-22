{ pkgs, ...  }:
{ 
nixpkgs.config.allowUnfree = true;
 # Enable CUPS to print documents.
  # services.printing.enable = true;
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.printing.drivers = [ pkgs.gutenprint pkgs.brlaser ];
  # for a WiFi printer
  services.avahi.openFirewall = true;
  services.avahi.publish.enable = true;
  services.avahi.publish.userServices = true;
  services.printing.browsing = true;
  services.printing.listenAddresses = [ "*:631" ]; # Not 100% sure this is needed and you might want to restrict to the local network
  services.printing.allowFrom = [ "all" ]; # this gives access to anyone on the interface you might want to limit it see the official documentation
  services.printing.defaultShared = true; # If you want
  hardware = {
    sane = {
      brscan4 = {
        enable = true;
      };
    };
  };

# Scanner
 hardware.sane.enable = true;
 #hardware.sane.extraBackends = [ pkgs.sane-backends ];
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 25565 ];
  # networking.firewall.allowedUDPPorts = [ 25565 ];
  # Or disable the firewall altogether.
}

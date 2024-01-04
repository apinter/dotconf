{ config, pkgs, lib, ... }:

{
systemd.user.services.flatpak-auto-update = {
      enable = true;
      description = "Update user Flatpaks";
      unitConfig = {
      };
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.flatpak}/bin/flatpak --user update -y";
      };
      #wantedBy = [ "default.target" ];
    };

systemd.user.timers.flatpak-auto-update = {
      enable = true;
      description = "Enable automatic flatpak updates";
      timerConfig = {
        OnCalendar = "daily";
        Persistent = "true";
      wantedBy = [ "multi-user.target" ];
      };
    };
}

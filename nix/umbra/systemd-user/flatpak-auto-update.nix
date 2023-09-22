{ config, pkgs, lib, ... }:

{
systemd.user.services.flatpak-auto-update = {
      enable = true;
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.flatpak}/bin/flatpak --user update -y";
      };
    };

systemd.user.timers.flatpak-auto-update = {
      enable = true;
      description = "Enable automatic flatpak updates";
      timerConfig = {
	OnCalendar = "daily";
        Persistent = "true";
      };
    };
}

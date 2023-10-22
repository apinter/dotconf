{ config, pkgs, lib, ... }:

{
systemd.services.node-exporter= {
      enable = true;
      unitConfig = {
	Description = "Node exporter";
        After = "network-online.target";
        Wants = "network-online.target";
      };
      wantedBy = ["multi-user.target"];
      preStart = "${pkgs.podman}/bin/podman kill node-exporter || true; ${pkgs.podman}/bin/podman rm node-exporter || true; ${pkgs.podman}/bin/podman pull quay.io/prometheus/node-exporter:latest";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.podman}/bin/podman run -d --name node-exporter --pid host -v /:/host:ro,rslave --network host quay.io/prometheus/node-exporter:latest --path.rootfs=/host ";
        Restart = "on-failure";
      };
    };

}


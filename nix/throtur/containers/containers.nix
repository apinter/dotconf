{ config, pkgs, lib, ... }:

{

virtualisation.oci-containers.containers."minecraft" = {
  autoStart = true;
  image = "docker.io/itzg/minecraft-server:latest";
  ports = [ "25565:25565" ];
  volumes = [
    "/home/throtur/VMs/containers/minecraft-home:/data"
  ];
  environment = {
    OPS = "adathor";
    JVM_XX_OPTS = "-XX:MaxRAMPercentage=65";
    EULA = "TRUE";
    MEMORY = "4G";
    };
  };
}
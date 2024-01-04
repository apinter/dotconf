{ config, lib, pkgs, ... }:

{
  boot.initrd.secrets = {
    "./.root.key" = /.root.key;
  };

  boot.initrd.luks.devices = {
    tank0 = {
      device = "/dev/disk/by-uuid/438c8528-8c7a-4dc0-beed-f5857e3434cf";
      allowDiscards = true;
      keyFile = "./.root.key";
      keyFileSize = 1024;
      fallbackToPassword = true;
    };
  };

  boot.initrd.luks.devices = {
    tank1 = {
      device = "/dev/disk/by-uuid/47b1d08a-e8e9-4f37-aada-e5752fba8bec";
      allowDiscards = true;
      keyFile = "./.root.key";
      keyFileSize = 1024;
      fallbackToPassword = true;
    };
  };

  boot.initrd.luks.devices = {
    tank2 = {
      device = "/dev/disk/by-uuid/9f6eca93-346e-498d-8a7e-93211461ac8a";
      allowDiscards = true;
      keyFile = "./.root.key";
      keyFileSize = 1024;
      fallbackToPassword = true;
    };
  };

  boot.initrd.luks.devices = {
    tank3 = {
      device = "/dev/disk/by-uuid/aeb5d7c6-4f5e-493e-a64a-96c550b409ca";
      allowDiscards = true;
      keyFile = "./.root.key";
      keyFileSize = 1024;
      fallbackToPassword = true;
    };
  };

  boot.initrd.luks.devices = {
    tank4 = {
      device = "/dev/disk/by-uuid/0b73fcea-cbc8-49ed-93b1-1cb4c017f74a";
      allowDiscards = true;
      keyFile = "./.root.key";
      keyFileSize = 1024;
      fallbackToPassword = true;
    };
  };

  boot.initrd.luks.devices = {
    tank5 = {
      device = "/dev/disk/by-uuid/4ed768e3-8791-46a4-ac94-ac344cdc41f8";
      allowDiscards = true;
      keyFile = "./.root.key";
      keyFileSize = 1024;
      fallbackToPassword = true;
    };
  };

  boot.initrd.luks.devices = {
    tank6 = {
      device = "/dev/disk/by-uuid/9a648ee4-3ec2-45ad-85fb-e16a3ddb13bf";
      allowDiscards = true;
      keyFile = "./.root.key";
      keyFileSize = 1024;
      fallbackToPassword = true;
    };
  };

  boot.initrd.luks.devices = {
    tank7 = {
      device = "/dev/disk/by-uuid/fc46c6ed-36c8-415a-8e9e-902a17837986";
      allowDiscards = true;
      keyFile = "./.root.key";
      keyFileSize = 1024;
      fallbackToPassword = true;
    };
  };

  services.zfs.trim.enable = true;
  services.zfs.autoScrub.enable = true;
  services.zfs.autoScrub.interval = "Sun, 01:00";
  services.zfs.autoSnapshot.daily = 7;
  services.zfs.autoSnapshot.weekly = 4;
  services.zfs.autoSnapshot.monthly = 12;

  boot.zfs.extraPools = [ "shirayuki" ];
}

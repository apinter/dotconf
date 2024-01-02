{ config, pkgs, lib, ... }:

{
  services.nfs.server.exports = ''
      /shirayuki/Aurora	            *(rw,insecure,no_subtree_check,no_root_squash,sync)
      /shirayuki/VMs/vdisk/	        172.168.30.25/32(rw,insecure,sync,no_subtree_check,no_root_squash)
      /shirayuki/sx52	              172.168.30.25(rw,insecure,sync,no_subtree_check,no_root_squash)
      /shirayuki/Backup/B4	        172.168.0.10(rw,async,no_subtree_check,no_root_squash)
      /shirayuki/Home/apinter	      172.168.30.25/32(rw,async,no_root_squash,no_subtree_check,insecure) 172.168.30.25(rw,async,no_root_squash,no_subtree_check,insecure)
      /shirayuki/Backup/kazeshini	  172.168.30.25/32(rw,async,no_root_squash,no_subtree_check,insecure)
      /shirayuki/Common	            172.168.0.0/16(rw,async,no_root_squash,no_subtree_check,insecure)
      /shirayuki/Home/nathan	      172.168.0.0/16(rw,async,no_root_squash,no_subtree_check,insecure)
      /shirayuki/Home/sofie	        172.168.0.0/16(rw,async,no_root_squash,no_subtree_check,insecure)
      /shirayuki/Home/apinter_jr	  172.168.0.0/16(rw,async,no_root_squash,no_subtree_check,insecure)
      /shirayuki/Home/skye	        172.168.0.0/16(rw,async,no_root_squash,no_subtree_check,insecure)
      /shirayuki/VMs	              172.168.30.25/32(rw,async,no_root_squash,no_subtree_check,insecure)
      /shirayuki/Crate-data         172.168.1.1/32(rw,insecure,sync,no_subtree_check,no_root_squash)
      #/shirayuki/Crate-data        172.168.1.1(rw,sync,fsid=0,crossmnt,no_subtree_check,no_root_squash)
      #/shirayuki/Backup/AutoYaST	  *(ro,subtree_check,root_squash)
    '';
}

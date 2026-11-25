{
  den.aspects.rosetta.nixos = { host, ... }: {
    fileSystems = {
      # Data Partition
      ${host.dataDrive.mount} = {
        device = "/dev/disk/by-uuid/D44E1F374E1F123A";
        fsType = "ntfs";
        options = [
          "defaults"
          "noatime"
          "nofail"
          "windows_names"
        ];
      };
    };
  };
}

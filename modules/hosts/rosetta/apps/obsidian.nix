{
  den.aspects.rosetta.homeManager = { host, config, ... }: {
    # Obsidian Settings
    programs.obsidian.vaults = {
      "Obsidian".target = "Documentos/Obsidian";
    };

    # Backups Service
    services.restic = {
      enable = true;

      backups.obsidian = {
        repository = "${host.dataDrive.backups}/Restic/Obsidian";
        passwordFile = "${config.xdg.configHome}/restic/obsidian";

        paths = [ "${host.dataDrive.home}/Documentos/Obsidian" ];
        initialize = true;

        pruneOpts = [
          "--keep-daily 7"
          "--keep-weekly 4"
          "--keep-monthly 6"
        ];

        timerConfig = {
          OnCalendar = "daily";
          Persistent = true;
          RandomizedDelaySec = "30m";
        };
      };
    };
  };
}

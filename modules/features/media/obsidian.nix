{
  den.aspects.obsidian.homeManager = { pkgs, ... }: {
    # App
    programs.obsidian = {
      enable = true;
      cli.enable = true;
    };

    xdg.mimeApps.defaultApplications = {
      "text/markdown" = "md.obsidian.Obsidian.desktop";
    };

    # Opencode Integration
    programs.opencode.skills = {
      obsidian = pkgs.fetchFromGitHub {
        owner = "obsidianmd";
        repo = "obsidian-skills";
        rev = "caf3e98cd22d810db164f26c9a442f0a280daa43"; # tag: 1.2.0
        hash = "sha256-Izjh+8Zd4I3PIDdpRSbMMygFC2VebBSIGjq8ZvK2xDo=";
      };
    };
  };
}

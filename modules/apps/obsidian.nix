{ den, ... }:
{
  den.aspects.obsidian = {
    includes = with den.aspects.obsidian; [ _ ];

    app.homeManager = { ... }: {
      programs.obsidian = {
        enable = true;
        cli.enable = true;
      };

      xdg.mimeApps.defaultApplications = {
        "text/markdown" = "md.obsidian.Obsidian.desktop";
      };
    };

    tools.homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        defuddle
      ];
    };

    skills.homeManager = { pkgs, ... }: {
      programs.opencode.skills = {
        obsidian = pkgs.fetchFromGitHub {
          owner = "obsidianmd";
          repo = "obsidian-skills";
          rev = "79e85b73ef041fdfb6437ab3824e2fe29eda9244"; # tag: 1.2.3
          hash = "sha256-uz6ABXOX1uxFAy8xLIuXEMGPuk9/MDKnQJLeKnVj7t4=";
        };
      };
    };
  };
}

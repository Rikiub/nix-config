{
  flake.aspects.git.homeManager = { user, ... }: {
    programs = {
      git = {
        enable = true;
        settings = {
          user = {
            name = user.name;
            email = user.email;
          };

          init.defaultBranch = "main";
          pull.rebase = true;
          push.autoSetupRemote = true;
        };
      };

      # Better diff
      delta = {
        enable = true;
        enableGitIntegration = true;
      };

      # Convenient TUI
      lazygit = {
        enable = true;
        enableNushellIntegration = true;
      };

      # GitHub CLI
      gh = {
        enable = true;
        settings = {
          git_protocol = "ssh";
          prompt = "enabled";
        };
      };
    };
  };
}

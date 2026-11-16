{
  den.aspects.git.homeManager = { user, ... }: {
    programs = {
      git = {
        enable = true;
        settings = {
          # Identity is opt-in: users can define it in their own aspect.
          user = {
            name = user.name;
            email = "rikiub.dev@gmail.com";
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

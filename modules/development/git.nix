{
  den.aspects.git.homeManager = { ... }: {
    programs = {
      git = {
        enable = true;
        settings = {
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

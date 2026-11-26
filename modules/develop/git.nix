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
      delta.enable = true;

      # Convenient TUI
      lazygit.enable = true;

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

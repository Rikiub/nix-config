{
  den.aspects.nushell.homeManager = { ... }: {
    programs = {
      nushell = {
        enable = true;
        settings = {
          show_banner = false;
          rm.always_trash = true;
        };
      };

      # Prompt
      starship = {
        enable = true;
        enableNushellIntegration = true;
        presets = [ "pure-preset" ];
      };

      # Completions
      carapace = {
        enable = true;
        enableNushellIntegration = true;
      };

      # cd shortcuts
      zoxide = {
        enable = true;
        enableNushellIntegration = true;
      };
    };
  };
}

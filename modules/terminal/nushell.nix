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
        presets = [ "pure-preset" ];
      };

      # Completions
      carapace.enable = true;

      # cd shortcuts
      zoxide.enable = true;
    };
  };
}

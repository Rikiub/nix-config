{
  den.aspects.fresh-editor.homeManager = { ... }: {
    # Set as default
    home.sessionVariables = {
      EDITOR = "fresh";
    };

    programs.fresh-editor = {
      enable = true;

      mutableSettings = true;
      settings = {
        theme = "dracula";
      };
    };
  };
}

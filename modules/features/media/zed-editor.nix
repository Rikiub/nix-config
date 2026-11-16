{
  den.aspects.zed-editor.homeManager = { ... }: {
    # Set as default
    home.sessionVariables = {
      VISUAL = "zeditor";
    };

    programs.zed-editor = {
      enable = true;

      mutableUserSettings = true;
      userSettings = {
        format_on_save = "on";
        theme = {
          mode = "system";
          light = "Catppuccin Latte";
          dark = "Catppuccin Frappé";
        };
      };

      extensions = [
        # Themes
        "catppuccin"

        # Languages
        "nix"
        "lua"
        "toml"
        "kdl"
        "python"
      ];
    };
  };
}

{ inputs, ... }:
{
  flake-file.inputs = {
    autopair-nu.url = "github:mst-mkt/autopair.nu";
  };

  den.aspects.nushell.homeManager = { ... }: {
    imports = [ inputs.autopair-nu.homeModules.default ];

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

      # Autopair
      autopair-nu.enable = true;
    };
  };
}

{
  flake-file.inputs = {
    autopair-nu = {
      url = "github:mst-mkt/autopair.nu";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.nushell.homeManager = { inputs, ... }: {
    imports = [ inputs.autopair-nu.homeModules.default ];

    programs = {
      nushell = {
        enable = true;
        settings = {
          show_banner = false;
          rm.always_trash = true;
        };
      };

      # Autopair
      autopair-nu.enable = true;

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

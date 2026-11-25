{
  den.aspects.shell.cli.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      trash-cli # Trash Manager
      tre-command # Tree
      ouch # Zip Manager
    ];

    programs = {
      # System Stats
      fastfetch.enable = true;
      btop.enable = true;

      # Explorers
      ripgrep.enable = true;
      yazi = {
        enable = true;
        enableNushellIntegration = true;
      };

      # TL;DR
      tealdeer = {
        enable = true;
        enableAutoUpdates = true;
      };
    };
  };
}

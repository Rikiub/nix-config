{
  flake.aspects.topgrade.homeManager = { ... }: {
    programs.topgrade = {
      enable = true;
      settings = {
        misc = {
          disable = [
            "nix"
            "home_manager"
          ];
          pre_sudo = true;
        };
      };
    };
  };
}

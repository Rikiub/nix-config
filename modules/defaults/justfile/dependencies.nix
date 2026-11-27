# Justfile dependencies

{
  den.default.homeManager = { user, ... }: {
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

    programs.nh = {
      enable = true;
      flake = user.flakeDirectory;
    };
  };
}

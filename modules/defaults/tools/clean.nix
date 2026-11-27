# Periodic nix-store cleaner

{
  den.default.homeManager = { ... }: {
    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep-since 30d --optimise";
      };
    };
  };
}

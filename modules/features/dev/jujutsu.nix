{
  den.aspects.jujutsu.homeManager = { user, ... }: {
    programs.jujutsu = {
      enable = true;
      settings = {
        user = {
          name = user.name or null;
          email = user.email or null;
        };
      };
    };
  };
}

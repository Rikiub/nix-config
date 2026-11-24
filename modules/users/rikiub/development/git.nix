{
  den.aspects.git = {
    provides.rikiub.homeManager = { ... }: {
      programs.git.settings = {
        user = {
          name = "Rikiub";
          email = "rikiub.dev@gmail.com";
        };
      };
    };
  };
}

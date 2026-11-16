{ den, ... }:
{
  # Hosts
  den.hosts.x86_64-linux = {
    rosetta.users.rikiub = { };
  };

  # Users
  den.aspects = {
    rikiub = {
      includes = with den.batteries; [ primary-user ];

      homeManager =
        { ... }:
        let
          user = {
            name = "Rikiub";
            email = "rikiub.dev@gmail.com";
          };
        in
        {
          programs.git.settings = { inherit user; };
          programs.jujutsu.settings = { inherit user; };
        };
    };
  };
}

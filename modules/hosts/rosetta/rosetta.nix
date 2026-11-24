{ den, ... }:
{
  # Host
  den.hosts.x86_64-linux = {
    rosetta.users.rikiub = { };
  };

  # User
  den.aspects.rikiub = {
    includes = with den.batteries; [ primary-user ];
  };

  # Host
  den.aspects.rosetta = { den, ... }: {
    includes = with den.aspects; [
      # System
      nixos

      # User
      desktop
      apps
      shell
      dev
      gaming
    ];
  };
}

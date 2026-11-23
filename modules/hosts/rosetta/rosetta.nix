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

  # Aspects
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

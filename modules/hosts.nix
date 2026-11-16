{ den, ... }:
{
  # Hosts
  den.hosts.x86_64-linux = {
    rosetta.users.rikiub = { };
  };

  # Users
  den.aspects.rikiub = {
    includes = with den.batteries; [
      primary-user
    ];
  };
}

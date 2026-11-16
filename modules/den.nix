{ den, ... }:
{
  den.hosts.x86_64-linux.rosetta.users.rikiub = { };

  den.aspects.rikiub = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
    ];
  };
}

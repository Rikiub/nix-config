{ den, lib, ... }:
{
  den = {
    schema.user.classes = lib.mkDefault [ "homeManager" ];

    hosts.x86_64-linux.rosetta.users.rikiub = { };

    aspects.rikiub = {
      includes = [
        den.batteries.define-user
        den.batteries.primary-user
      ];
    };
  };
}

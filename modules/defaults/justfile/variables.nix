# Shared variables to reuse

{
  den.schema.user = { user, lib, ... }: {
    options = {
      flakeDirectory = lib.mkOption {
        type = lib.types.str;
        default = "/home/${user.name}/.flake";
      };
    };
  };
}

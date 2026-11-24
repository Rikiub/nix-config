# Shared variables for reuse

{
  den.schema.user = { user, lib, ... }: {
    options.flakeDirectory = lib.mkOption { type = lib.types.str; };
    config.flakeDirectory = lib.mkDefault "/home/${user.name}/.flake";
  };
}

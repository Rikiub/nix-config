{
  den.schema.user = { user, lib, ... }: {
    options.flakeDirectory = lib.mkOption { type = lib.types.path; };
    config.flakeDirectory = lib.mkDefault "/home/${user.name}/.flake";
  };
}

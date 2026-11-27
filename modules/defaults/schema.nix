# Shared variables to reuse

{
  den.schema.host = { lib, ... }: {
    options = {
      stateVersion = lib.mkOption {
        type = lib.types.str;
        description = "Version shared between NixOS and Home-Manager.";
        default = "26.11";
      };
    };
  };

  den.schema.user = { user, lib, ... }: {
    options = {
      flakeDirectory = lib.mkOption {
        type = lib.types.str;
        description = "Directory where global flake lives.";
        default = "/home/${user.name}/.flake";
      };
    };
  };
}

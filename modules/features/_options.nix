{ lib, ... }:
{
  options = {
    host = lib.mkOption {
      type = lib.types.submodule {
        options = {
          name = lib.mkOption {
            type = lib.types.str;
            description = "Name of the current host.";
          };
          system = lib.mkOption {
            type = lib.types.str;
            description = "System arch of the current host.";
          };
        };
      };
    };

    user = lib.mkOption {
      type = lib.types.submodule {
        options = {
          name = lib.mkOption {
            type = lib.types.str;
            default = "rikiub";
            description = "Username of the current user.";
          };
          label = lib.mkOption {
            type = lib.types.str;
            default = "Rikiub";
            description = "Friendly display of the current user.";
          };
          email = lib.mkOption {
            type = lib.types.str;
            default = "rikiub.dev@gmail.com";
            description = "Email used for git commits.";
          };
        };
      };
      default = { };
    };
  };
}

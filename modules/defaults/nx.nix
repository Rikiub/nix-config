# Global helper for access to flake justfile from anywhere

{ den, ... }:
{
  # Exposes flake apps under the name of each host / home for building with nh.
  perSystem = { pkgs, ... }: {
    packages = den.lib.nh.denPackages { fromFlake = true; } pkgs;
  };

  den.default.homeManager = { pkgs, user, ... }: {
    programs.topgrade = {
      enable = true;
      settings = {
        misc = {
          disable = [
            "nix"
            "home_manager"
          ];
          pre_sudo = true;
        };
      };
    };

    programs.nh = {
      enable = true;
      flake = user.flakeDirectory;
    };

    home.packages = [
      (pkgs.writeShellApplication {
        name = "nx";
        runtimeInputs = with pkgs; [ just ];
        text = ''
          #!/usr/bin/env bash
          set -euo pipefail

          if [[ -f "${user.flakeDirectory}/justfile" ]]; then
            exec just -f "${user.flakeDirectory}/justfile" "$@"
          fi

          printf 'Error: no justfile found in: "${user.flakeDirectory}"' >&2
          exit 1
        '';
      })
    ];
  };
}

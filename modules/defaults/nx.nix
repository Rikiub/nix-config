# Global helper for access the flake justfile from anywhere

{ den, lib, ... }:
{
  # Exposes flake apps under the name of each host / home for building with nh.
  perSystem = { pkgs, ... }: {
    packages = den.lib.nh.denPackages { fromFlake = true; } pkgs;
  };

  den.default.homeManager =
    {
      pkgs,
      user,
      ...
    }:
    let
      cmd_name = "nx";
      justfile = "${user.flakeDirectory}/justfile";
    in
    {
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

      # Global helper
      home.packages = [
        (pkgs.writeShellApplication {
          name = cmd_name;
          runtimeInputs = with pkgs; [ just ];
          text = ''
            #!/usr/bin/env bash
            set -euo pipefail

            if [[ -f "${justfile}" ]]; then
              exec just -f "${justfile}" "$@"
            fi

            printf 'Error: no justfile found in: "${justfile}"' >&2
            exit 1
          '';
        })
      ];

      # Carapace completions
      xdg.configFile."carapace/specs/nx.yaml" = {
        text = lib.generators.toYAML { } {
          name = cmd_name;
          description = "Global flake justfile";
          run = [
            "just"
            "--justfile"
            "${justfile}"
          ];
        };
      };
    };
}

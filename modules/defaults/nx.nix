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
      # Justfile dependencies
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
        # Global helper
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

        # Carapace dependencies
        pkgs.jq
      ];

      # Carapace completions
      xdg.configFile."carapace/specs/${cmd_name}.yaml" =
        let
          flakeShow = "nix flake show --json ${user.flakeDirectory}";

          hosts = [
            "$(${flakeShow} | jq --raw-output '.nixosConfigurations | keys[]')"
          ];
          devShells = [
            "$(${flakeShow} | jq --raw-output '.devShells.[] | keys[]')"
          ];
        in
        {
          text = lib.generators.toYAML { } {
            name = cmd_name;
            run = [
              "just"
              "--justfile"
              "${justfile}"
            ];
            commands = [
              {
                name = "switch";
                description = "Build and activate the new configuration";
                completion.positional = [ hosts ];
              }
              {
                name = "test";
                description = "Build and activate the new configuration (until next reboot)";
                completion.positional = [ hosts ];
              }
              {
                name = "develop";
                description = "Shell to a build environment";
                completion.positional = [ devShells ];
              }
              {
                name = "git";
                description = "Run git on flake directory";
                run = [ "git" ];
              }
            ];
          };
        };
    };
}

# Helper to access flake justfile from anywhere

{ lib, ... }:
{
  den.default.homeManager =
    { pkgs, user, ... }:
    let
      command_name = "flake";
      justfile = "${user.flakeDirectory}/justfile";
    in
    {
      home.packages = [
        # Helper command
        (pkgs.writeShellApplication {
          name = command_name;
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
      xdg.configFile."carapace/specs/${command_name}.yaml" =
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
            name = command_name;
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

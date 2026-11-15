{
  flake.aspects.nx.homeManager =
    { pkgs, config, ... }:
    let
      flakeDir = "${config.xdg.configHome}/nixos";
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
        flake = flakeDir;
      };

      home.packages = [
        (pkgs.writeShellApplication {
          name = "nx";
          runtimeInputs = with pkgs; [ just ];
          text = ''
            #!/usr/bin/env bash
            set -euo pipefail

            if [[ -f "${flakeDir}/justfile" ]]; then
              exec just -f "${flakeDir}/justfile" "$@"
            fi

            printf 'Error: no justfile found in: "${flakeDir}"' >&2
            exit 1
          '';
        })
      ];
    };
}

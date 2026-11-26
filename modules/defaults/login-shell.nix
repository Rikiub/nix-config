# Default shell for root and users

{ den, ... }:
let
  shell = "nushell";
in
{
  den.default = {
    includes = [ (den.batteries.user-shell shell) ];

    nixos = { pkgs, ... }: {
      # Required for pkexec.
      environment.shells = [ pkgs.${shell} ];
    };

    homeManager = { ... }: {
      # Allow programs to override shell config
      home.shell.enableShellIntegration = true;

      # Change `nix develop` and `nix-shell` too.
      programs.nix-your-shell = {
        enable = true;
      };
    };
  };
}

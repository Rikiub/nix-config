# Default shell for system and users

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
      # Change `nix develop` and `nix-shell` default shell.
      programs.nix-your-shel.enable = true;

      # Allow programs to override shell config
      home.shell.enableShellIntegration = true;
    };
  };
}

# Default shell for root and users

{ den, ... }:
let
  shell = "nushell";
in
{
  den.default = {
    includes = [ (den.batteries.user-shell shell) ];

    nixos = { pkgs, ... }: {
      environment.shells = [ pkgs.${shell} ];
    };
  };
}

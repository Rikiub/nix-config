{
  den.default.nixos =
    { pkgs, ... }:
    let
      shell = "nushell";
    in
    {
      # Required for pkexec
      environment.shells = [ pkgs.${shell} ];

      # Set shell
      programs.${shell}.enable = true;
      users.defaultUserShell = pkgs.${shell};
    };
}

# Enabled den batteries

{ den, ... }:
{
  den.default.includes = with den.batteries; [
    hostname # Set hostname from each den host
    define-user # Create users from each den user
    host-aspects # Include homeManager in hosts from aspects
    flake-scope # Expose `lib`, `inputs` and `den` on args
  ];
}

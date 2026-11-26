{ lib, ... }:
{
  den.default.nixos = {
    # Disable firewall by default
    networking.firewall.enable = lib.mkDefault false;
  };
}

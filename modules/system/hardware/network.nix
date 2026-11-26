{ den, ... }:
{
  den.aspects.hardware.network = {
    includes = with den.aspects.hardware.network; [
      firewall
      networkmanager
      iwd
    ];

    firewall.nixos = { ... }: {
      networking = {
        firewall.enable = true;

        # Use nftables instead of iptables
        # Could make issues with docker
        nftables.enable = true;
      };
    };

    networkmanager.nixos = { ... }: {
      networking.networkmanager.enable = true;
    };

    iwd.nixos = { ... }: {
      networking = {
        # Prefer iwd as networkmanager wireless backend
        networkmanager.wifi.backend = "iwd";

        # Settings
        wireless.iwd = {
          enable = true;
          settings = {
            Network = {
              EnableIPv6 = true;
            };
            Settings = {
              AutoConnect = true;
              AddressRandomization = true;
            };
          };
        };
      };
    };
  };
}

{ den, ... }:
{
  den.aspects.network = {
    includes = with den.aspects.network; [
      networkmanager
      # iwd
    ];

    networkmanager.nixos = { ... }: {
      # Use NetworkManager as main
      networking.networkmanager.enable = true;
    };

    iwd.nixos = { ... }: {
      # Prefer iwd as wireless backend
      networking = {
        networkmanager.wifi.backend = "iwd";
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

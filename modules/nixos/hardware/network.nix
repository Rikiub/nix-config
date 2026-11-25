{
  den.aspects.network.nixos = { ... }: {
    # Use NetworkManager as main
    networking.networkmanager.enable = true;

    # Prefer iwd as wireless backend
    networking.networkmanager.wifi.backend = "iwd";
    networking.wireless.iwd = {
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
}

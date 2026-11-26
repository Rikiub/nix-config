{
  den.aspects.dev.firewall.nixos = { ... }: {
    networking.firewall.allowedTCPPorts = [
      8081 # Expo Go
    ];
  };
}

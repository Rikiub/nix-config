{
  den.aspects.dev-ports.nixos = { ... }: {
    networking.firewall.allowedTCPPorts = [
      8081 # Expo Go
    ];
  };
}

{
  den.aspects.dev.firewall.nixos = { ... }: {
    networking.firewall.allowedTCPPorts = [
      80 # HTTP
      443 # HTTPS
      3000 # Common for React, Node.js, etc.
      5173 # Vite development server
      8000 # Common for Django, Python HTTP server, etc.
    ];
  };
}

{
  den.aspects.nix.nixos = { ... }: {
    # Metadata
    system.nixos.label = "NixOS";

    # NixOS Documentation
    documentation.nixos = {
      enable = false;
    };
  };
}

{
  den.aspects.system.nix-ld.nixos = { ... }: {
    # Improve compability with apps
    programs.nix-ld = {
      enable = true;
    };
  };
}

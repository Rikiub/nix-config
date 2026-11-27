{
  den.default.nixos = { ... }: {
    # Remove warning because is verbose and unnecesary
    nix.settings.warn-dirty = false;
  };
}

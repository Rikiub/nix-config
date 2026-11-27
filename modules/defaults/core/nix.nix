# Nix Configuration

{
  den.default.nixos = { ... }: {
    nix.settings = {
      # Remove warning because is verbose and unnecesary
      warn-dirty = false;

      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}

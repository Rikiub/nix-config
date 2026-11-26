# Enabled experimental features for nix

{
  den.default.nixos = { ... }: {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}

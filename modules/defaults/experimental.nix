# Enabled Experimental Features for Nix

{
  den.default.nixos = { ... }: {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}

# Nixpkgs Configuration

{
  # Nixpkgs
  flake-file.inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-lib.follows = "nixpkgs";
  };

  # Auto follow/deduplicate
  flake-file.auto-follow.enable = true;

  # Configuration
  den.default.nixos = { ... }: {
    system.stateVersion = "26.11";
    nixpkgs.config.allowUnfree = true;
  };
}

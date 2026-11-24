# Nixpkgs Configuration

{ inputs, ... }:
{
  flake-file.inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-lib.follows = "nixpkgs";
  };

  # Auto follow/deduplicate
  imports = [ inputs.flake-file.flakeModules.auto-follow ];

  # Configuration
  den.default.nixos = { ... }: {
    system.stateVersion = "26.11";
    nixpkgs.config.allowUnfree = true;
  };
}

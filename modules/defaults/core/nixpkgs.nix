# Nixpkgs Configuration

{
  flake-file.inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-lib.follows = "nixpkgs";
  };

  den.default.nixos = {
    system.stateVersion = "26.11";
    nixpkgs.config.allowUnfree = true;
  };
}

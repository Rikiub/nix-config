{ inputs, ... }:
{
  flake-file.inputs = {
    # Nix Packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-lib.follows = "nixpkgs";

    # Host Addons
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Core
    den.url = "github:denful/den";
  };

  imports = with inputs; [
    (flake-file.flakeModules.dendritic or { })
    (flake-parts.flakeModules.debug or { })
    (den.flakeModule or { })
  ];

  # Enable flake-parts debug for LSP
  debug = true;
}

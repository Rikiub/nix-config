# NixOS and Nixpkgs Configuration

{
  flake-file.inputs = {
    # Nix Packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-lib.follows = "nixpkgs";

    # Extras
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.default.nixos = {
    system.stateVersion = "26.11";
    nixpkgs.config.allowUnfree = true;
  };
}

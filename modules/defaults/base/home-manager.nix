# Home Manager Configuration

{ lib, ... }:
{
  flake-file.inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.default = {
    homeManager = { pkgs, ... }: {
      home.stateVersion = "26.11";

      # Avoid errors for existing dotfiles
      home.backupCommand = "${pkgs.trash-cli}/bin/trash";
    };

    nixos = { ... }: {
      # Use the system pkgs for home-manager users
      home-manager.useGlobalPkgs = true;
    };
  };

  # Enable home-manager by default
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}

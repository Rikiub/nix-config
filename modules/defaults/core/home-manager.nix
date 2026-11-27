# Home Manager Configuration

{ lib, ... }:
{
  flake-file.inputs = {
    home-manager.url = "github:nix-community/home-manager";
  };

  den.default = {
    homeManager = { host, pkgs, ... }: {
      home.stateVersion = host.stateVersion;

      # Avoid errors for existing dotfiles
      home.backupCommand = "${pkgs.trash-cli}/bin/trash";
    };

    nixos = { ... }: {
      # Use system pkgs for home-manager
      home-manager.useGlobalPkgs = true;
    };
  };

  # Enable home-manager by default
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}

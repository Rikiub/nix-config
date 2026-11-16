{ den, lib, ... }:
{
  den.default = {
    includes =
      (with den.batteries; [
        hostname # Set system hostname from `den.hosts`
        define-user # Create users from `den.users`
        host-aspects # Include homeManager in hosts from aspects
        flake-scope # Expose `lib`, `inputs` and `den` on args
      ])
      ++ (with den.aspects; [
        flatpak # Any aspect can declare flatpak packages
        xdg # Ensure packages follow XDG specs
      ]);

    nixos = { ... }: {
      system.stateVersion = "26.11";

      # Experimental features
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Allow unfree packages
      nixpkgs.config.allowUnfree = true;

      # Use the system pkgs for home-manager users
      home-manager.useGlobalPkgs = true;
    };

    homeManager = { pkgs, ... }: {
      home.stateVersion = "26.11";

      # Avoid errors for existing dotfiles
      home.backupCommand = "${pkgs.trash-cli}/bin/trash";
    };
  };

  # enable hm by default
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}

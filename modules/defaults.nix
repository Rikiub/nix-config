{ den, lib, ... }:
{
  den.default = {
    includes = with den.aspects; [
      den.batteries.hostname
      den.batteries.define-user
      den.batteries.flake-scope

      flatpak
      xdg
    ];

    nixos = { ... }: {
      system.stateVersion = "26.11";
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

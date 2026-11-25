{ den, lib, ... }:
{
  den.aspects.desktop.niri = {
    includes = with den.aspects; [
      noctalia.shell
      noctalia.greeter
      gnome-keyring
    ];

    nixos = { ... }: {
      programs.niri.enable = true;
    };

    homeManager =
      { ... }:
      let
        configDir = ./config;

        # List all files in the directory
        includes = lib.concatMapStringsSep "\n" (f: ''include "${f}"'') (
          lib.filter (lib.hasSuffix ".kdl") (lib.filesystem.listFilesRecursive configDir)
        );
      in
      {
        # Configuration
        wayland.windowManager.niri = {
          enable = true;
          extraConfig = lib.mkBefore includes;
        };

        xdg.terminal-exec.enable = true; # Required for spawn terminal
        services.wl-clip-persist.enable = true; # Persistent clipboard
      };
  };
}

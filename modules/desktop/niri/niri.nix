{
  den.aspects.desktop.niri = { den, ... }: {
    includes = with den.aspects; [
      noctalia.shell
      noctalia.greeter
    ];

    nixos = { ... }: {
      programs.niri.enable = true;
    };

    homeManager =
      { lib, ... }:
      let
        configDir = ./config;

        # List of all files in the directory
        includes = lib.concatMapStringsSep "\n" (name: ''include "${configDir}/${name}"'') (
          lib.attrNames (
            lib.filterAttrs (name: type: type == "regular" && lib.hasSuffix ".kdl" name) (
              builtins.readDir configDir
            )
          )
        );
      in
      {
        # Config
        wayland.windowManager.niri = {
          enable = true;
          extraConfig = lib.mkBefore includes;
        };

        # Persistent clipboard
        services.wl-clip-persist.enable = true;
      };
  };
}

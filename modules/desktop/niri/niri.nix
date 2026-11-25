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
      in
      {
        # Config
        wayland.windowManager.niri = {
          enable = true;
          extraConfig = lib.mkMerge [
            (lib.mkBefore ''
              include "${configDir}/animations.kdl"
              include "${configDir}/layout.kdl"
              include "${configDir}/rules.kdl"
              include "${configDir}/keybinds.kdl"
              include "${configDir}/misc.kdl"
              include "${configDir}/output.kdl"
              include "${configDir}/input.kdl"
            '')
          ];
        };

        # Persistent clipboard
        services.wl-clip-persist.enable = true;
      };
  };
}

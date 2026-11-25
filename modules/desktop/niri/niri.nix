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
      { pkgs, ... }:
      let
        localDir = ./config;
        configDir =
          pkgs.runCommand "niri-config-checked"
            {
              nativeBuildInputs = [ pkgs.niri ];
            }
            ''
              cp -r ${localDir} $out
              chmod -R u+w $out

              niri validate --config $out/config.kdl
            '';
      in
      {
        # Config
        wayland.windowManager.niri.enable = true;
        xdg.configFile = {
          "${toString localDir}/modules".source = "${configDir}/modules";
          "${toString localDir}/config.d".source = "${configDir}/config.d";
          "${toString localDir}/config.kdl".source = "${configDir}/config.kdl";
        };

        # Persistent clipboard
        services.wl-clip-persist.enable = true;
      };
  };
}

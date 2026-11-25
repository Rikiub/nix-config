{ den, ... }:
{
  den.aspects.noctalia.shell = {
    includes = with den.aspects.noctalia; [ theme ];

    nixos = { ... }: {
      programs = {
        noctalia = {
          enable = true;
          recommendedServices.enable = true;
        };
        gpu-screen-recorder.enable = true;
      };
    };

    homeManager = { ... }: {
      programs.noctalia = {
        enable = true;
        settings = ./config/shell.toml;
      };

      wayland.windowManager.niri.extraConfig = ''
        include "${./config/niri.kdl}"
        include optional=true "noctalia.kdl";
      '';
    };
  };
}

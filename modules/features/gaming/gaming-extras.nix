{
  den.aspects.gaming-extras = { den, ... }: {
    includes = with den.aspects; [ mangohud ];

    nixos = { ... }: {
      programs = {
        gamemode.enable = true;
        gamescope.enable = true;
      };
    };
  };
}

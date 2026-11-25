{ den, ... }:
{
  den.aspects.gaming.performance = {
    includes = with den.aspects; [ mangohud ];

    nixos = { ... }: {
      programs = {
        gamemode.enable = true;
        gamescope.enable = true;
      };
    };
  };
}

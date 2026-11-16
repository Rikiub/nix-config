{ den, ... }:
{
  den.aspects.gaming-extras = {
    includes = with den.aspects; [ mangohud ];

    nixos = { ... }: {
      programs = {
        gamemode.enable = true;
        gamescope.enable = true;
      };
    };
    homeManager = { ... }: { };
  };
}

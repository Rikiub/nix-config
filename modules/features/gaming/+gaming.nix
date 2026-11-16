{ den, ... }:
{
  den.aspects.gaming = {
    includes = with den.aspects; [
      gaming-extras

      heroic
      steam
    ];

    nixos = { };
    homeManager = { };
  };
}

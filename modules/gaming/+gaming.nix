{ den, ... }:
{
  den.aspects.gaming = {
    includes = with den.aspects; [
      gaming.performance
      heroic
      steam
    ];
  };
}

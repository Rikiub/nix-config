{
  den.aspects.gaming = { den, ... }: {
    includes = with den.aspects; [
      gaming-extras

      heroic
      steam
    ];
  };
}

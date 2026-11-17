{
  den.aspects.boot = { den, ... }: {
    includes = with den.aspects; [
      limine
      plymouth
    ];
  };
}

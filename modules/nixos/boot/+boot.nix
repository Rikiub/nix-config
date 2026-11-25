{ den, ... }:
{
  den.aspects.boot = {
    includes = with den.aspects; [
      limine
      plymouth
    ];
  };
}

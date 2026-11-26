{ den, ... }:
{
  den.aspects.bootloader = {
    includes = with den.aspects; [
      limine
      plymouth
    ];
  };
}
